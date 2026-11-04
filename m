Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824362;
	b=S/bBpLwA7DXqxvHCdvXpEN41Sh8sKKGtDqJrbR5TvlmnMsInmWGuDUhXJ0WxVt9ex9Vk
	 3F7unLbhGJye2Hvjoom6O2gTBYG+q3rdD4H37z3oZ2kt+GEY5adOS7mjDB4Ob1vcaXKYv
	 F0t/cJO+RdgO8DMn5jwvTVc40Cew+C65c5Tby3JuG60QNBWcLgc4T2kRp2Uy5b9egKWg+
	 9CoQL5SQGjT4fZT3Htq2hPY7XcoVKzc1kMCd6PJ48QFOW3IdPmxDvPi3+W8DX741sIWig
	 5AE7iooBuJ1mSEPicKVuOW4GX15ZZXJTmwgC0aPvajDhN7sbep1n1RWex/duADarHwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=/lO0mL+cBkndSMWtbQjIRUpGnu/CrhJuhEAaumulM8U=;
	b=BU9fDhUTS66/15sn4bhSyHi/wtYL6uu6hnJSksnJtOeKrwYzDhemPWMumIDkmrTnBxdo
	 9n/edqNJk8Zz7BdCskkmbW6bgOfYrExSnvJ3HJIGKniv1rFjHCd6SH7aSX3g6HYfZ5eoo
	 plJ0/I658UrkJVUYS/3hgAomzwo+nxe2deGWy3KQFm/D3pXf1I3qbEDrFCWzCqg1uWhP5
	 50BP3hYkRPLA8ibAoZlYVSK3mt78GNWwoDtFmDgbOhqFYvVmPZ1wojwIQqDcnoYmRsnvh
	 /LopcxGE2rG4taSdz3IcozacvE7I819uGuqNhHKKXTYPLKkxOAPwQS3lBs1gRzHxBzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=azykdYLR;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F8606A847;
	Wed,  4 Nov 2026 20:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0F8606A847
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=azykdYLR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824362; x=1825360362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6f8UgVjKpQ2wVNTwKjGWI3IG5kYob1To5ZXvPuHXznw=;
  b=azykdYLRMV+Zru+0A7b/DkYuNubzZsIpW/0gDE9PhJBscjZ8sZlhtsj3
   QSkQ+XOSIQbg7vjgJ+33BRRniLnHeWYLHEoaE9wACUvKv5NJPqvkTyM5p
   Hc1yJrjIP5rHWLT6QrceUqs+NOdL9qk8Kn1EbVREctTyq4JUxn67nKSBx
   rNmxngRxfJ7OdkgwXr+zXCORu11/VV/Id7JDlhO24Qo+fFg429CxtKopk
   Elaww18k4nm/RtUKhNfWA8DNxc0Z32200kbc4EJ130OjwTOqiZPdTkhxI
   02/j9tCw7B2WZjRk+uJWZihEgThCcz1IyHVLsEUz3qy/xM4WniYXhxzGF
   A==;
X-CSE-ConnectionGUID: xzlB9NeVSCmof9VCC5gQ4A==
X-CSE-MsgGUID: oKqOyZUlTWWmR/KAjmQyeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2590654"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2590654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:32:41 -0800
X-CSE-ConnectionGUID: oeRVokCFTSG70c80N5OpXQ==
X-CSE-MsgGUID: cq871yY0SA+tQsjaqT4Xmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6690148"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:32:23 -0800
Date: Wed, 4 Nov 2026 22:32:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Chanh Nguyen <chanh@os.amperecomputing.com>,
	Alistair Francis <alistair@alistair23.me>,
	Julius Werner <jwerner@chromium.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Dmitry Osipenko <digetx@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
Message-ID: <auuWVGsyb3RrOIfh@ashevche-desk.local>
References: <20261102135330.2493332-1-robh@kernel.org>
 <20261104-vigorous-flat-dingo-3e5bd2@quoll>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-vigorous-flat-dingo-3e5bd2@quoll>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 06:32:43PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 02, 2026 at 07:53:22AM -0600, Rob Herring (Arm) wrote:
> > Unit-addresses by default (and most commonly) are hexadecimal. There's a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.

...

> > --- a/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> > +++ b/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> > @@ -123,7 +123,7 @@ properties:
> >          const: 0
> >  
> >      patternProperties:
> > -      "^layer@[0-9]+$":
> > +      "^layer@[0-9a-f]+$":
> 
> These two lines are looking good.
> 
> Andy, it's okay if I give Rb tag?

Yes, again a pointer to 34d1e754155b ("dt-bindings: iio: drop unneeded quotes").

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I expect to see

 Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> # xylon

or something that matches the piece you reviewed.

-- 
With Best Regards,
Andy Shevchenko


