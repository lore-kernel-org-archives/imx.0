Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C316020FA9C
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276664; cv=none; b=SqvrhJWk6eTPlwQpJvCYeCf/okM2GKd3jiunZcIc0do95lxZInEr5VXlWMgUxvrmas8Le+PV0KZ7j05730gZLZJOEJzrh2335FVKG942a233RVfPUnZYcujsa37UYLnvLZTNbgR67HxrLux/uKWs1ks999B/e+hDQfkRDME9Cs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276664; c=relaxed/simple;
	bh=2AyLsA6kpaZlc9OA+14Q7DYMgAO3xGKomEWFDhjNkAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAwfEvkeFTOHt/PGqItTuumMDIaZXHm9M27ZE4SXdUqFmJSAd6qZaZqmwlvMVcdJEQm4ZGk4hSXxLfSQ77ryzlUJE0oV8uj1kJDDqo+BnvJMQ70IXrhC2IEqV0hyR4B/FS6SAsRTCWhD2gz0XS8wic7qRX2pvzBe6ieG2pXYrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BPZ6lc22; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BPZ6lc22"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E08844204;
	Thu, 10 Apr 2025 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744276661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVo01i0PNBk6lg4xGIJ8PjEi6i48tSdwoY71vr+3/ZY=;
	b=BPZ6lc22WEcSMe8CUuDX6IdWkZjegNMuPMHhuQnIHsABPK4+qY/y7h7txbaVdU4DuLyh7j
	7F045SrvyIJD2DGlJYSZEQTBqN24+L2eFO3yQ9VuqDXa45BZJ19mDLEqczz312FWfM9pke
	HRkAnO0QHbIX+XZ3F2JFIQ8psy3H4AyvQdHDGsJ1fN6dAxS9qTFfCijywHNWCvbU7bOlNm
	h3VF9UiXrJFb3aKhTMyiZpryGQVcCH14nd6MIt1zW0vsN+i41AtMEUbZ//1dYL/VfkT+2O
	IlHQlvoEd//ZRVGSuf6h8PcoUTtwi1EJOMKMa94Vdxdi3iKmF1sDu30eWaoFhQ==
Date: Thu, 10 Apr 2025 11:17:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 2/2] rtc: pcf85063: handle stopped oscillator at startup
Message-ID: <202504100917398f7244e9@mail.local>
References: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
 <20250410082548.3821228-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410082548.3821228-3-ciprianmarian.costea@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheptghiphhrihgrnhhmrghrihgrnhdrtghoshhtvggrsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 10/04/2025 11:25:48+0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> If the RTC is not linked to any battery, the oscillator is stopped at
> startup and a SW reset command is generated to the PCF85063 RTC.
> Manually start the oscillator in case the PCF85063 RTC is not battery
> backed.
> 

No, there is no point in starting the oscillator with a know wrong
time/date. The oscillator must only be started once the time is known
good, that is in .set_time

> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/rtc-pcf85063.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index 4fa5c4ecdd5a..6de7344d2469 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -590,6 +590,14 @@ static int pcf85063_probe(struct i2c_client *client)
>  
>  	i2c_set_clientdata(client, pcf85063);
>  
> +	if (of_property_read_bool(client->dev.of_node, "no-battery")) {
> +		err = regmap_update_bits(pcf85063->regmap, PCF85063_REG_SC,
> +					 PCF85063_REG_SC_OS, 0);
> +		if (err)
> +			return dev_err_probe(&client->dev, err,
> +					"Failed to start the oscillator\n");
> +	}
> +
>  	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &tmp);
>  	if (err)
>  		return dev_err_probe(&client->dev, err, "RTC chip is not present\n");
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
