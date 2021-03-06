<?php echo $header; ?>
<div class="container">
  <header>
    <div class="row">
      <div class="col-sm-6">
        <h1 class="pull-left">1<small>/2</small></h1>
        <h3><?php echo $heading_title; ?><br>
          <small><?php echo $text_upgrade; ?></small></h3>
      </div>
      <div class="col-sm-6">
        <div id="logo" class="pull-right hidden-xs"><img src="view/image/logo.png" alt="OpenCart" title="OpenCart" /></div>
      </div>
    </div>
  </header>
  <div class="row">
    <div class="col-sm-9">
      <h3><?php echo $text_steps; ?></h3>
      <fieldset>
        <ol>
          <li><?php echo $text_error; ?></li>
          <li><?php echo $text_clear; ?></li>
          <li><?php echo $text_admin; ?></li>
          <li><?php echo $text_user; ?></li>
          <li><?php echo $text_setting; ?></li>
          <li><?php echo $text_store; ?></li>
        </ol>
      </fieldset>
      <h3>Upgrade Progress</h3>
      <fieldset>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_progress; ?></label>
          <div class="col-sm-10">
            <div class="progress">
              <div id="progress-bar" class="progress-bar" style="width: 0%;"></div>
            </div>
            <div id="progress-text"></div>
          </div>
        </div>
      </fieldset>
      <div class="buttons">
        <div class="text-right">
          <input type="submit" value="<?php echo $button_continue; ?>" id="button-continue" class="btn btn-primary" />
        </div>
      </div>
    </div>
    <div class="col-sm-3"><?php echo $column_left; ?></div>
  </div>
  <script type="text/javascript"><!--
var step = 1;

$('#button-continue').on('click', function() {
	$('#button-continue').prop('disabled', true);
	
	start('index.php?route=upgrade/upgrade/next');
});

function start(url) {
	$('#progress-bar').css('width', ((step / <?php echo $total; ?>) * 100) + '%');
	$('#progress-text').html('<span class="text-info"></span>');

	$.ajax({
		url: url,
		type: 'get',
		dataType: 'json',
		success: function(json) {
			if (json['error']) {
				$('#progress-bar').addClass('progress-bar-danger');
				$('#progress-text').html('<div class="text-danger">' + json['error'] + '</div>');
				
				$('#button-continue').prop('disabled', false);
			}

			if (json['success']) {
				$('#progress-bar').addClass('progress-bar-success');
				$('#progress-text').html('<span class="text-success">' + json['success'] + '</span>');
			}
			
			if (json['next']) {
				//start(json['next']);
			}
			
			if (json['redirect']) {
				location = json['redirect'];
			}	
			
			step++;		
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
//--></script></div>
<?php echo $footer; ?>