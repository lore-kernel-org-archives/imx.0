Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D54E36FA
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672465; cv=none; b=ApCvwTdJaQwCApwmyF0LRBqRYxZ2aaAfewStaWV4HKUNb8fHT8lpNmYI8u8yY3yyE70i9RZEqRXg27hAoxAty3T5dPmtmca6w55qtAMoIkOwlJkWIMNFeQHSwYO0J3XziwZAXi45WmRXR/rQLXnfDmHG9/jnFFj7kJnyZF9SVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672465; c=relaxed/simple;
	bh=PsT9NM7+x95sDVcyjkUlLYsDInNrGTwBFmY0J5z/2I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9kCLTQeUOQWHKKJactdhCcw59YZS1Q4yYLgm9aaVjz7KJSfOgGPCSZTCSIhzO6RbkJ+8Vjdxgb71pDXql1G3vdz2AeY89YVq1pGttmL7fvtv68AxrufZJQrrw7mptZIjGXGBdsHFybyjPK/DTu4/SYI6jZC1DNNt9V/4SAC+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq9Jxy5/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq9Jxy5/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so729902f8f.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789672462; x=1790277262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzYLOWyfgGEEFvCR5EarhALHCHgWymVUp+bDyHHXrVg=;
        b=Vq9Jxy5/ZHswKQbZ9RERT1CMWLO4lQvG2Z9dP5wh5FmggFEDQF/SYXpz8mlsCApOG9
         JRR9kcKxZArPcUGOuAgD0YUsP500ct9VjKDYBFlaQ/DyZ59P9/biuYHlIwDU4vDH5mCm
         +1d43U/p7PqoGCJzS7+60h6sM+5qGxiXUWS6ps1MfNBbvYFsP7dxgs8eyzGPydTzGli+
         b4zcULDy/iRZGNR1bMzZHv7JzDQAjp00piFEup6nSP7D/Jv1S7WSv7gXd1kZBZoFfT6Z
         Be3XtWrKSn32NtuSy/1ltClmh/02q6jYYR4v3G+HCQCCNgXmZC6eAUw3lqMxWlfAOzd1
         UbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672462; x=1790277262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzYLOWyfgGEEFvCR5EarhALHCHgWymVUp+bDyHHXrVg=;
        b=oK41Ubpykukb5gwTv41sCPBj0bjLg/4qCFO/on9B0+6rQBACnjM2gUFL5Z/+v/hwAD
         iNTqYoWo7HYFvOy49zTP7Gubnu5eZWjOEYBmeX7+xZBzjpuFlX+4KcoOiXDB1uA2eEAd
         w0Lik9nQvtTfx4LkcKslJ9ZxcERj/GAG3ey0wzx1DPb/NM7HKSn5kddN1GIABVIdZ6AI
         QhaQjDUzSxZukny7V2ZCrCcRudvsU+VHap3ZkVhqoUgKkBe/E/XiExkXS+gXK2pfEMAC
         /Vsf+Vh1zdLIN1JkHELtaOocd/3PydGMHSV/ch6Saww4Xfv7OVA0qhew231r8hQxJ4z9
         Wz1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBAaaPfs38zkZRuCwnVvMt0/hW1xNlW//Q7G/HnpJXeolMc8Ob4pcM9A8hetuJ/darLO8=@lists.linux.dev
X-Gm-Message-State: AFuF++mAng+lt3F5TmoOCRG8fHF4VNwpms6myVjTISUep2P6EHVcLqqu
	mDhU892jCEpGlR87ICyg7L5Da7631jivxelFNBbrSmE5QX+kaCJ7rXWB
X-Gm-Gg: AYBFou2kfMxvKhcK6Ck4Uf4+NnyYIkWcxfDVlt1cukK4Bw3SjQj9fMsnJkZ86aps6ar
	BoI/LhjJFPLPqACv6bxqqCnGR4BOWfvX2eLyvSHMiWwtBEFdWnWScamUs/DYZx1kJAn/IvRQpmZ
	IK/Ywg6mZiidup0UxmEoRlOi1dbMLV7FOCxw4WYJiiUxPldIx/jSSsL9sV6shBUZzS+srl0hefs
	6/UNU+pVLVo6V5M1JWZu20jhEL11LBEn/cJTq5+oicqCu0zENsnhvl+/g7PBSs7OPQvRYhERyuN
	ygFpFXRZIMMKa5LawbeEvoTyguaCDdrE9sYWf1c1miq6CNOA7BXo8Br1KpRTG1yUKkUkV0qkUX0
	phcXMdaBD3OldWGQ3Og71f/BzPPu28ZK6CSyzbuh6NsZNC5jbkA5+/ysKPnF+a6yZaGV/koY6YK
	loTSPSws/w+XGPyJoAGiEfC0GWqzR0tg1D4aABk5zfj3fJbPtHcMnYc8oPoBTtrd1GbWMj8ldIi
	78Rq7HE/K9jpijPYGIxjY4/H9yS9TGZtIxCSPUHCu6RR2SfKeBCEYKDEaRammCpMvqXsemr4tZQ
	qs9HH5h1/ptKOKkgtl7xnuOg/oOw
X-Received: by 2002:a05:6000:25f3:b0:487:f37:7ece with SMTP id ffacd0b85a97d-4870f3780a7mr20918885f8f.0.1789672461701;
        Thu, 17 Sep 2026 12:14:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm17755585f8f.20.2026.09.17.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:14:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:14:19 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Message-ID: <aqw8C2YwvXOcRYPV@Lord-Beerus.station>
References: <cover.1789659585.git.stefano.r@variscite.com>
 <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
 <20260917155033.C43521F00899@smtp.kernel.org>
 <aqw2zT8W6EvRroWj@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqw2zT8W6EvRroWj@SMW015318>

On Thu, Sep 17, 2026 at 01:51:57PM -0500, Frank Li wrote:
> 
> tpm_tis_core.c have not parser reset-gpios. ref
> 
> static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned long id)
> {
>         struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
> 
>         return gpiod_set_value_cansleep(priv->reset, 1);
> }
> 
> suppose it should be GPIO_ACTIVE_LOW to assert reset line
> 
> Frank

Thanks Frank.

You're right, tpm_tis_i2c currently does not parse a reset control.
I have proposed a separate patch to add optional reset support using
the reset framework:

https://patchwork.kernel.org/project/linux-integrity/patch/20260917124211.136221-1-stefano.r@variscite.com/

Also, the reset line is active-low, so you are right, GPIO_ACTIVE_LOW
is the correct polarity here.

Would you prefer me to send v3 without the TPM DTS patch for now,
and add it back once the reset support patch has been accepted?

Best Regards,
Stefano
