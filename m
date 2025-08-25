Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3292F5301;
	Mon, 25 Aug 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756130087; cv=none; b=qrWZY6JBkP5tcbXlkoVa/WHC7neFgAVhsZ2+/yg7RHNbSJkCVyQZOoUQtxhShDtW/g14uM7VIVPFGb/tFXSVVGSEcM2uRiePP7NgEARoWduxJf56A66+saxpuW8vW5j7jEUfNiZC/wVXGyE+2OlwNdsYudY97v6toJYHUY94MxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756130087; c=relaxed/simple;
	bh=TTmrBrZoJC2sMBlIzCVuZ+M6Jyt5KedMiBHTNZzEgF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgBWJ8vPgTLPaTJWRCwCArdpgrUf8MZ6NCHFB9EOrZpt9ZZ5G+Yqcd/9vf9rwXp9eIu0lvTnBHQC+ryxkjkYUodOga4yRD3oqp1RcWGNoSM0CCSNu58a/vbplodCj5qkb8CY/QUY7ePZ1t7IKlWn65x9cw2OVAYQ7iYQ8va6WsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QD4oZaZy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QD4oZaZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756130080; x=1787666080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TTmrBrZoJC2sMBlIzCVuZ+M6Jyt5KedMiBHTNZzEgF8=;
  b=QD4oZaZyJCsz//ZL9XJSsZqANyap08caSxAXIgy4Wr9epE4wf3Z+2wLJ
   0Su1sug48dScJjMLRxyEas7CaxXTP3SQIcfLjDXiCs70jfa9jthrM/Nx9
   8nosnpZZc6SuO4WrEtMZnqlyQlfYCxSvDzCKQcHeT24tUMgBMiGPb6zqf
   7eA41kPRE8VdI7a5d9S8/AxnuS1ZNReR/gHInUV6In/7RJY0LCFh1nwqH
   JfOPEgP8ty8iIxXnW8R9WY/kcnFJ9uqW73fLsWy/MQhRwgl/QBzR807lr
   I55OdPTUd75YyHo7RqmLgTA/IBzZpvg56RwNYiiijLhdXDlHJz9i6HDqs
   g==;
X-CSE-ConnectionGUID: 0R66kqwHS/CD5nFiemW6Gw==
X-CSE-MsgGUID: YYpYFRBwSnC2VSaa9dV66g==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68936956"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="68936956"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:54:34 -0700
X-CSE-ConnectionGUID: rcvs9Wk2TxuCyBixjcl46A==
X-CSE-MsgGUID: CcuJn5fpRmOD8ckHIX0AHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="168547695"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:54:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D43D2121F7B;
	Mon, 25 Aug 2025 16:54:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqXe5-00000007POf-3W6F;
	Mon, 25 Aug 2025 16:54:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Andreas Klinger <ak@it-klinger.de>,
	Crt Mori <cmo@melexis.com>,
	Waqar Hameed <waqar.hameed@axis.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Bo Liu <liubo03@inspur.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sean Nyekjaer <sean@geanix.com>,
	Frank Li <Frank.Li@nxp.com>,
	Han Xu <han.xu@nxp.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Gustavo Vaz <gustavo.vaz@usp.br>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Abhash Jha <abhashkumarjha123@gmail.com>,
	chuguangqing <chuguangqing@inspur.com>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Per-Daniel Olsson <perdaniel.olsson@axis.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Laight <david.laight@aculab.com>,
	Jakob Hauser <jahau@rocketmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 09/12] iio: magnetometer: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 25 Aug 2025 16:53:58 +0300
Message-ID: <20250825135401.1765847-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Also drop checking for errors on pm_runtime_put_autosuspend() in
bmc150_magn_set_power_state().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/iio/magnetometer/ak8974.c        |  2 --
 drivers/iio/magnetometer/ak8975.c        |  1 -
 drivers/iio/magnetometer/als31300.c      |  2 --
 drivers/iio/magnetometer/bmc150_magn.c   | 13 ++++---------
 drivers/iio/magnetometer/tmag5273.c      |  2 --
 drivers/iio/magnetometer/yamaha-yas530.c |  2 --
 6 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
index 947fe8a475f2..68ece700c7ce 100644
--- a/drivers/iio/magnetometer/ak8974.c
+++ b/drivers/iio/magnetometer/ak8974.c
@@ -583,7 +583,6 @@ static int ak8974_measure_channel(struct ak8974 *ak8974, unsigned long address,
 	*val = (s16)le16_to_cpu(hw_values[address]);
 out_unlock:
 	mutex_unlock(&ak8974->lock);
-	pm_runtime_mark_last_busy(&ak8974->i2c->dev);
 	pm_runtime_put_autosuspend(&ak8974->i2c->dev);
 
 	return ret;
@@ -678,7 +677,6 @@ static void ak8974_fill_buffer(struct iio_dev *indio_dev)
 
  out_unlock:
 	mutex_unlock(&ak8974->lock);
-	pm_runtime_mark_last_busy(&ak8974->i2c->dev);
 	pm_runtime_put_autosuspend(&ak8974->i2c->dev);
 }
 
diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
index a1e92b2abffd..3fd0171e5d69 100644
--- a/drivers/iio/magnetometer/ak8975.c
+++ b/drivers/iio/magnetometer/ak8975.c
@@ -775,7 +775,6 @@ static int ak8975_read_axis(struct iio_dev *indio_dev, int index, int *val)
 
 	mutex_unlock(&data->lock);
 
-	pm_runtime_mark_last_busy(&data->client->dev);
 	pm_runtime_put_autosuspend(&data->client->dev);
 
 	/* Swap bytes and convert to valid range. */
diff --git a/drivers/iio/magnetometer/als31300.c b/drivers/iio/magnetometer/als31300.c
index 928e1378304c..c083bef53573 100644
--- a/drivers/iio/magnetometer/als31300.c
+++ b/drivers/iio/magnetometer/als31300.c
@@ -140,7 +140,6 @@ static int als31300_get_measure(struct als31300_data *data,
 	*z = ALS31300_DATA_Z_GET(buf);
 
 out:
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
@@ -401,7 +400,6 @@ static int als31300_probe(struct i2c_client *i2c)
 	pm_runtime_set_autosuspend_delay(dev, 200);
 	pm_runtime_use_autosuspend(dev);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	ret = devm_iio_device_register(dev, indio_dev);
diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magnetometer/bmc150_magn.c
index 761daead5ada..6a73f6e2f1f0 100644
--- a/drivers/iio/magnetometer/bmc150_magn.c
+++ b/drivers/iio/magnetometer/bmc150_magn.c
@@ -257,22 +257,17 @@ static int bmc150_magn_set_power_mode(struct bmc150_magn_data *data,
 
 static int bmc150_magn_set_power_state(struct bmc150_magn_data *data, bool on)
 {
-#ifdef CONFIG_PM
-	int ret;
+	int ret = 0;
 
-	if (on) {
+	if (on)
 		ret = pm_runtime_resume_and_get(data->dev);
-	} else {
-		pm_runtime_mark_last_busy(data->dev);
-		ret = pm_runtime_put_autosuspend(data->dev);
-	}
-
+	else
+		pm_runtime_put_autosuspend(data->dev);
 	if (ret < 0) {
 		dev_err(data->dev,
 			"failed to change power state to %d\n", on);
 		return ret;
 	}
-#endif
 
 	return 0;
 }
diff --git a/drivers/iio/magnetometer/tmag5273.c b/drivers/iio/magnetometer/tmag5273.c
index bdb656b031b1..bd3c50157843 100644
--- a/drivers/iio/magnetometer/tmag5273.c
+++ b/drivers/iio/magnetometer/tmag5273.c
@@ -295,7 +295,6 @@ static int tmag5273_read_raw(struct iio_dev *indio_dev,
 
 		ret = tmag5273_get_measure(data, &t, &x, &y, &z, &angle, &magnitude);
 
-		pm_runtime_mark_last_busy(data->dev);
 		pm_runtime_put_autosuspend(data->dev);
 
 		if (ret)
@@ -668,7 +667,6 @@ static int tmag5273_probe(struct i2c_client *i2c)
 	indio_dev->channels = tmag5273_channels;
 	indio_dev->num_channels = ARRAY_SIZE(tmag5273_channels);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	ret = devm_iio_device_register(dev, indio_dev);
diff --git a/drivers/iio/magnetometer/yamaha-yas530.c b/drivers/iio/magnetometer/yamaha-yas530.c
index 340607111d9a..d49e37edcbed 100644
--- a/drivers/iio/magnetometer/yamaha-yas530.c
+++ b/drivers/iio/magnetometer/yamaha-yas530.c
@@ -623,7 +623,6 @@ static int yas5xx_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		pm_runtime_get_sync(yas5xx->dev);
 		ret = ci->get_measure(yas5xx, &t, &x, &y, &z);
-		pm_runtime_mark_last_busy(yas5xx->dev);
 		pm_runtime_put_autosuspend(yas5xx->dev);
 		if (ret)
 			return ret;
@@ -664,7 +663,6 @@ static void yas5xx_fill_buffer(struct iio_dev *indio_dev)
 
 	pm_runtime_get_sync(yas5xx->dev);
 	ret = ci->get_measure(yas5xx, &t, &x, &y, &z);
-	pm_runtime_mark_last_busy(yas5xx->dev);
 	pm_runtime_put_autosuspend(yas5xx->dev);
 	if (ret) {
 		dev_err(yas5xx->dev, "error refilling buffer\n");
-- 
2.47.2

