Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317CE1A9B28
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742234644; cv=none; b=T1Vvhf+IWpbIZ1BDpyjZ1b1pahM0Qk8YCiSMCKH7zwUHrs7qPgQCFAXuLrQ+Y8fRMchcTVPIfktJj8TF0lJuGSlYpU6brFlbfIAw5Y+4HOpBgCNNZiIxbBQgvOFt9LC4pen1sKM80q8bm1pClWrJpQ6KuO7xUuBOg8BxXJaeLYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742234644; c=relaxed/simple;
	bh=awgPAnbrbkaZkPs7TRo9ZTe/vWz9ohJbUh9GSIfTsRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPSrxItoH4rq8Eud02AdJUXc+3hZaHjQCtJccCuNNKikWePQsbITe3743pA2lduq+wCF9iryAps8gQzrYK4/rFYZzTVijv/habso2Y8bYdEx5S4IVYHOTa+34DbhIQ6WznvjthOfPlZBIg9hrbHVBLTHVIGhnnJRH7kXVXlCtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO58918d; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO58918d"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso944069666b.3
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742234641; x=1742839441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMs0KQ2xoYfGwipz0GcDyzvKZDx/2Bps5YmVJfONNew=;
        b=ZO58918dv0MGWg2bM/x9gPsT5r0f8/Gf4Q7iG/3Onv3pHzyQLACChI7k1kzXXjTF3Q
         huBoWnHf2ItVOj4oUVuglg4Tabm075+Be1SyX4zaftt5ZQAkvtSiL0sh/Q51ZyiyF3Dt
         EcSSOl7GoFxLa7cwRY6gEHOhXhjMMu4obfmcbrKFji8DtbAOxyKVx5KbkBF29kwG0NS4
         lV75nhDv9q36lLtIJLfE1So7uJyho3pUA5/5uX1NAp2VEH7jjJsPXHiGYCR0BdTJXw4r
         +XtS+/X2+/Uu6PaVbEXJ2Post7FsNdAX2Zh5eMOETBbEhn0Q2NDh3QGJxf7nx32nvBxp
         qmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742234641; x=1742839441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMs0KQ2xoYfGwipz0GcDyzvKZDx/2Bps5YmVJfONNew=;
        b=ZGIssCKBr37SWaQePVQbRj604Rdg2R0/R1PtJaVD5VayvWvxAHjLIhbfqDc0CKLIvV
         YxyphG0w0xUZQ6VpapU2Nc6SQCanVqC626kKV01N5wpfA29svZIbY/DF91ZJTeMxobB3
         MnlP0XHQ9ck3ALbCchVS9qrn9LwAiVzs6nDNs8E2B3swZyFevtXp6eEH8ed7slTw/ltB
         0YEE1c2o47Dbc2Pt23pSqaVO64vxG81J3VAIov3/msoGQs1a9VNzzWNhGHjP7PSAJbET
         gde6UWDMeWGKj9VdhEp+7xbwg4lmG7TOPbLcLafcDAAXcHYFLzqGSMhKUldfw5CbQWG6
         PdIA==
X-Forwarded-Encrypted: i=1; AJvYcCVO56UkD3Ax+aHA3T0g2ZKJnivPXcMXn1UGJ1m79xAb1VLA4rsybo3q8iLgakMLWzUGMWw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo84VeprHBLCqH+29b+QAa7LYt9/TXQU31/6meOblvxio7QZqc
	xU91yBUnG6W921oyP73HNsfrD8VWzzECO7IjxYgklMfKN1ULfz/3
X-Gm-Gg: ASbGncu3xzEfflaSbjY/yB7Ek7uU6E6yRDQlirztNDgJ5rggrXtCwGew1KhjVxbgsBL
	10suQC2Dj9NQ+0n8AslTqlXW9fc2M3jXOgUQLCzB+Sm2hMmM0HNr15G7E7co0Ir/J92AuTOzgUC
	7/xmEUVZRP99ZpvlngrILK7yJrPA5w/uNSlbPEa2TNYu2Ui6YcsH/LwWHHqIJwZ7XLDehtNQzgQ
	XPmkrLerSq21V5oYKb3Vgee0WhmDaDKKnZ2Oe4IQqrhoT0bXhVyhSewNJ1BKvqYor/fyoY42EEu
	eeSx2CkjlZCMwUAhT/TA+HvKFYHYk8Fb0dRH2WbgsEfqdGsI59EULGqnaf9l4ApiOMTLt6XgcO1
	qmkltHYsS5h5FRzHFwwm8PSZ1m/WAQmr5E3HpjkGLHkF5PPGZgVYjQw==
X-Google-Smtp-Source: AGHT+IEqHcYMxvD4RWbMqL7gZkeMlgl4L7sidotxxKm051Mjf5HVCCNTwf97wRSQF+aZjoUe1nGS6g==
X-Received: by 2002:a17:906:6a0a:b0:ac2:b414:ba2a with SMTP id a640c23a62f3a-ac330376bb6mr1524996566b.37.1742234641045;
        Mon, 17 Mar 2025 11:04:01 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-252-211-62.retail.telecomitalia.it. [95.252.211.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cdec8sm705009766b.112.2025.03.17.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:04:00 -0700 (PDT)
Date: Mon, 17 Mar 2025 19:03:58 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>

On Mon, Mar 17, 2025 at 05:07:26PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 09:47, Alberto Merciai wrote:
> > While playing with linux-next and imx93-11x11-evk via NFS and TFTP
> > I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
> > not builtin then the I was not able to reach userland. 
> > 
> > The following configs were needed to reach my goal:
> > CONFIG_DWMAC_IMX8=y
> > CONFIG_STMMAC_ETH=y
> > CONFIG_NVMEM_IMX_OCOTP_ELE=y
> > 
> > is that something expected?
> 
> You mean they are disabled or you just did not put them inside your
> initramfs?
> 
> Best regards,
> Krzysztof

Hello,

By default they are enabled as external modules, then until we don't
reach userland they are not loaded thus eth and all the mechanism behind
that are out.

I'm not using initramfs just tftp and NFS as follows:
setenv loaddtb "tftp 0x80400000 imx93-11x11-evk.dtb"
setenv loadkernel "tftp 0x83000000 Image"
setenv netargs "setenv bootargs console=ttyLP0,115200 root=/dev/nfs ip=dhcp nfsroot=192.168.1.3:/tftp/root,v3,tcp"
setenv bootcmd "run loaddtb; run loadkernel; run netargs; booti 0x83000000 - 0x80400000;"

Do you think that initramfs can solve that?

To be honest I was expecting to have a builtin driver for eth by
default, so that NFS and TFTP can be turned on without caring about the rest.
But for sure I'm missing something  there :)

Thanks,
Alberto
