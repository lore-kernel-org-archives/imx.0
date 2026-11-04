Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824475;
	b=cG7O1wDyWKpbiCevHdQvya4s+UE1Db6vcP3TG2EFEFVuvlbke4dHgrUm4Vt7np2pY7zr
	 pDzpNM07ZF86oKxXusO76y2uyvIfPjL76tdjhHwQd5Ts95aVN2c9Ix9NGfr0CWaf8AflZ
	 vbLqHUx3veK9z/KIcEU/xcX1V0yYhhU1XTKGPP9aP/tk65+BuV8eWel7LKh4gHauEYZ3w
	 WFJro1o4GjxJ0XemWhQOvow9qEtI0fEG2XYHT68JIowVfVLPNldwkMSMnm6cEpfnykMoD
	 Nj+qE0xD+vO4oI6nK5fTSqQRVAhedBhHCZYf/y2K/VDPzm9x7n1DGGC4ctSpidBTHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824475;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=qRsZY3xueLsYo81EeFYIjiC4t2ZfkCtOq22VvO5dYxA=;
	b=3lAYys/3aUNzgcFVId0uMZErYDJ5gGLCNrCDUugKbH5FBzN0YW3JCw5NpWkWkCHurVwA
	 iVjJjnFm1kWZGyrLPPEsw+/br4sbcbhZX+Z5940UeXhEQGYfL3vuKXf6pnskXGaeJKw2s
	 kUywQINpqG/82vuDv6VEbY/b7qTm8XSO6JEQWRA+hFEjhTeGeV/3zHiw328v2t+QKZfEo
	 HUdC1kY/GHiISDZJzn/aSbPqnG2Wey3Da1WHb/MWzqGZh/gndzYNAnvWPLKdH+5AOZDN5
	 vkPeBbNdcJAS7a/MKUoXyz4O0aiUoagogC7AZTaw+HPo2Pq1pzCVvDSkXZIOJtSrNsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flLLQg46;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA9606AB34
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 20:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BAA9606AB34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flLLQg46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824475; x=1825360475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=StSSW5/xpW0MGVJqCQ72E4YsaavMQP4nt5umVauhYso=;
  b=flLLQg46O2M6J+ogWtr7H/PhnqpoImgqcs/izKeta51h0tYW8OYbtEg1
   w/vaj6rYDYoiaq7f7Jf8/+SawRJmBGjwOQiurRaKoIm6Et22V6bR7cqBK
   gPn7a5DvdCavOJ17ijfCvAZIqY7i14ORggAtOApCbo0krNLQo8hfA0RyL
   dDJCIDA/92Du1TY8czZhnyVBTPTCEG8CB7OpalKnSp+TPCDqHOzCnqyLU
   SGVux3/s/ghcmwUeVv8xV5Z3guv7k6YUzcdIIvmCzagkd2jHxYNeueI5D
   PlJz1ELxyATHZMRNuFGkUCJRp5HaduC0YMkrD2l1jhv0ShY1aJuJsk8ZN
   w==;
X-CSE-ConnectionGUID: j/E+iLspSeOVucV4VWEyfA==
X-CSE-MsgGUID: Njw8HtkpRr+WHqwUitvclw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2613583"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2613583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:34:34 -0800
X-CSE-ConnectionGUID: rXnAXH6STZCbtlf11xATow==
X-CSE-MsgGUID: nn0XOPIDS0qODXMv7b+VxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7138628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:34:29 -0800
Date: Wed, 4 Nov 2026 22:34:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	T Pratham <t-pratham@ti.com>, Thorsten Blum <blum@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Pan Chuang <panchuang@vivo.com>,
	Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
	"open list:CRYPTO API" <linux-crypto@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:QUALCOMM CRYPTO DRIVERS" <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] crypto: use dmaengine_desc_set_callback()
Message-ID: <auuW0safpswDmp13@ashevche-desk.local>
References: <20261102164538.3834039-1-Frank.Li@oss.nxp.com>
 <7b476c24-3185-49ff-9a72-fbd865dc0d65@kernel.org>
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
In-Reply-To: <7b476c24-3185-49ff-9a72-fbd865dc0d65@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 06:51:10PM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2026 17:45, Frank.Li@oss.nxp.com wrote:

> > diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
> > index 84392411b98d8..49f1bf19747d8 100644
> > --- a/drivers/crypto/atmel-aes.c
> > +++ b/drivers/crypto/atmel-aes.c
> > @@ -824,8 +824,7 @@ static int atmel_aes_dma_transfer_start(struct atmel_aes_dev *dd,
> >  	if (!desc)
> >  		return -ENOMEM;
> >  
> > -	desc->callback = callback;
> > -	desc->callback_param = dd;
> > +	dmaengine_desc_set_callback(desc, callback, NULL, dd);
> >  	dmaengine_submit(desc);
> >  	dma_async_issue_pending(dma->chan);
> >  
> 
> Apparently reviewing only a few lines of entire patch is still reviewing:
> https://lore.kernel.org/all/9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org/
> 
> Therefore:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Yep, in a form of

  Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-aes

or something that makes it clear what has been reviewed.

-- 
With Best Regards,
Andy Shevchenko


