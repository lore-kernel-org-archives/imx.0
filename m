Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE94D293C44;
	Mon, 25 Aug 2025 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153644; cv=none; b=Xlme6a/dHBLKnVc4WzEG0C8REmqZ1Wyo2pkSgaFiodrnbEebHLL8MsVznZRyWfWKQpgyCadi1r7uIXkNsSB9VeNK97/xbtJ3wfOPpGSL9KbWAl7ai0wPjbMJ9iwCdfWtBAGzI8w8oshE1IBV1/GZYcnjy0jAZcZKYuwkFhGtcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153644; c=relaxed/simple;
	bh=FHQO1qIi2frWsYih6E50v+BhkfadCKotC8hnJWvlN0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGYd62AgFQY7o4EPi+D4xXTmayv70aDfMEjov4A58JWRTjmbkYJPTlrgpKE/H68ryyb1XXY69sllfzlGu9FXvwJtwXvjAg1gPcZ0oS018kivBap0+Qjj1n9ul5YZcStb2pECXm3QMGDBln9Q70l4msk2CQ1rBdKnlAhO6Bgk80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKXgdt4G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKXgdt4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153643; x=1787689643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHQO1qIi2frWsYih6E50v+BhkfadCKotC8hnJWvlN0w=;
  b=YKXgdt4G0pRpd8TyM1A0DHQLaW8HdRWvxl2bOHLCbVr/d0xXJrRdX9b5
   kUvKU4fbDXAwOZ7zujoqJPqcH8vI4qSc4bn3cWD0GkBzb7tWGduwxuG+u
   96t4AMIm8wrQ/hw1dyeNwpvZGZAO4RvLsATHLAUi6fAY7zWs29RrNaJah
   NJ0CMTM2UXozNzEUw9FkQfHO1+3fMrxhk7pNX8zGcu+MLqHang+KFuKp+
   Uw+YOivxa6Ziu5va94NjYL+cc5r9mxiScADEVMVE8rsLmFZDSRcu+DueC
   sFnzmzT3qE5Q26ABpsvBRmqXPDnk67JFeE5kw/PcH0k8/dBHrGvJ2Hl4q
   g==;
X-CSE-ConnectionGUID: TM3Ax8fVQ72pjilvrwNhvA==
X-CSE-MsgGUID: 3q6CnvtVSiGW7dc4COzD1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69091779"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69091779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:27:22 -0700
X-CSE-ConnectionGUID: YE42RwvDQ1q8EEEGZm/Fzg==
X-CSE-MsgGUID: 4f0lYBFsQNCvAitTLdcEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200282208"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:27:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2961711FB0F;
	Mon, 25 Aug 2025 23:27:09 +0300 (EEST)
Date: Mon, 25 Aug 2025 23:27:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
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
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
	Waqar Hameed <waqar.hameed@axis.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>, Bo Liu <liubo03@inspur.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Sean Nyekjaer <sean@geanix.com>,
	Frank Li <Frank.Li@nxp.com>, Han Xu <han.xu@nxp.com>,
	Rayyan Ansari <rayyan@ansari.sh>, Gustavo Vaz <gustavo.vaz@usp.br>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
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
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Laight <david.laight@aculab.com>,
	Jakob Hauser <jahau@rocketmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 05/12] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aKzHHZ4y-lA-b5YW@kekkonen.localdomain>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
 <20250825135401.1765847-6-sakari.ailus@linux.intel.com>
 <20250825160023.4070bbc1@jic23-huawei>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825160023.4070bbc1@jic23-huawei>

Hi Jonathan,

On Mon, Aug 25, 2025 at 04:00:23PM +0100, Jonathan Cameron wrote:
> > @@ -95,18 +95,8 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
> >  	if (en && dac->common->hfsel)
> >  		udelay(1);
> >  
> > -	if (!enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > -		pm_runtime_put_autosuspend(dev);
> > -	}
> > -
> > -	return 0;
> > -
> > -err_put_pm:
> > -	if (enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > -		pm_runtime_put_autosuspend(dev);
> > -	}
> > +err_pm_put:
> > +	pm_runtime_put_autosuspend(dev);
> 
> now the put is here, whether or not there was ever a get as the get is
> gated on enable()

Oops. I'll fix this in v4, with just this patch as the rest are merged.

-- 
Regards,

Sakari Ailus
