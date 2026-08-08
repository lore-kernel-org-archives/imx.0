Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60C3B71B1
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180444; cv=pass; b=rD3nLwGgiPCe6HqtGtANNg5emQDCrdKJaS3QyDVH0gUPjThYT5KAG1mU0HkRfoAxjJklUVmPKnbz+K3S4pqxMZ2HP7bMn3wpgdv3SWVy16+4WxPt2Zq90FgY5YEBm12nZ6Gzd4/C3Tpt2B/QftbXc4cMBqu5EZ2ZGQxu22yEeKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180444; c=relaxed/simple;
	bh=SW0OzW5Q6cloa9Rxxh7Kt9JcaYqdq1ZnXoJCraKu5D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOOWZ2BoZGhKBWZyJia7JrsIU5XTtB2GSJZrQ/ff0+gXBZbE5L1XJDxT/GvFjBnAoP2gU25ILwLTXzerJgJV5QPwu8OMOA/EUbAqh0Mx9KSGtpcUfue3HE269EDTjbJ6j+33PEGjfhveGCn1uEGkj7h13yFR5Nj36wcQ+TRYOsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYl5Fvk1; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYl5Fvk1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc891373e0so3699745ad.2
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 02:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786180442; cv=none;
        d=google.com; s=arc-20260327;
        b=hG20+WAQBl9L2Y6v7dtCoxtW8CDaBccmRYL+Wq9JlBqaEGndxH2KcSo76SNgOLeFQk
         gvMPU4323onZ80tbJ5S6KNekH+jnS/rtN22PyhNm2ElYEHFQRyg4EoV9CJbSR0IjjtPb
         rfDVWlP8j1Eu9RSKQ/vXbTAZGP7f3c5WLwklmVjxyfev8PZHpjKuv2VibfDTm1o0vuVy
         xofhhoPQhMVCtO/iJWsL9QLmkAebM10urQswukTF2bptJZCyOv/WtWPugAQeb9P2pGtv
         rUVejfj5lC+Wldt2Oa5UaSPAd39IiYOmYc+0wC+yjrn5ZuuqNjWgbUJ8xoJ1Vm6+jO6W
         UEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jYz7Hr0nWMfjm5X6TMKm8e+654rRQUBbNqDnjzx0Iws=;
        fh=iAfK060sqdBlQblqjx7beWWn2sYY+WxIt5GQiSF4PJE=;
        b=QFTgw4DN1OzojUmXvwqR+NeZADLqXEvMC+l+GQpT7QUQ/O79BbMZN8j2VI3k9BuNSS
         LJC8TGBaSlPwRKTuKXB/wpZ1zGk4/l3RAJ9UX1Z2/6YQOgh7yekPJrMxS5dF3bdX65CB
         AEt4mSrma593gjDqB9vJZY6TIRYOls72HP9bzInfJn5cHPr2BhgE4sbdihqcMa1HO21u
         ZT8LDPOm6xZbSAXTvTm8wheCnqtvckpofFcQdplEc+32qKu4s82CU0khrbnXLVMLmSx+
         39RkuoleHOhPezwcueMLWoDH5DGK/oyGIHehubtfrwWs4aOzuJe3Zo9X6loOON7QDuZN
         yEfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180442; x=1786785242; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYz7Hr0nWMfjm5X6TMKm8e+654rRQUBbNqDnjzx0Iws=;
        b=CYl5Fvk1sqK5SG8mgjF51AdAOaqet8dbFCg7QWx6t6h1zBzfI6ZI9/0EYUl/Kv4f4N
         fXdvyqjRhcbM8W5H9VY7NGYW0nkHjcxvCBl6+Uco41SbGKT8jxpG6w+yvpjSeDFJPztL
         uAgbKq2RPNH/FWi3nNyDM9zYzh5SIMLMNRTw/ytnaZg1D/qO8drPxOBeI6Lji9+YlvYe
         3iA/vhNiKow/8LPqVMOTo8/kk1m/y/2+p/LI1D3fgfyicA+L7f66AqTSDEDQZGsnoghr
         HPN6Ui15+JCYOdH5nJ5l7kZCKnTAahRV2kaCd9//HlPlEklptm0s3T1xRowYyKQYgssh
         XdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180442; x=1786785242;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jYz7Hr0nWMfjm5X6TMKm8e+654rRQUBbNqDnjzx0Iws=;
        b=PUPh9/gC60SC5gnC2WiRj1qsK/TTbodIOqrkTgYX92qBnZogZRCZtmTjz7GZA1RZN0
         GyGN35XrOJQOvHnMkXwSqqFgQua1/VTMe8157sHBvsU6LYMlrt4vhNSINraqSjCG0UPt
         TW6DkQ/kFNbLSRV1fREIbu7rQyZ59AdAF3zzdOBiaiPmhXu+GFyEIo21AdEnXOm7U5pg
         CxtPi5treEuO5ADiR50Zm4DdyyqUfmZpMbCCtDQNuJU9kHuL3N0bpRef68pViCVMLTbl
         v1IIbgZoRE9UgLOHozrj7N78lh72Cviqa913WC9thCF3e37ApLaIT9ejbtd0RMX6nrcC
         d9MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Pz+ELTsluyixzy7ZBU/TOk7JX+dfPy/47pMC67hHo9/HnUdcyVeizkbW/DCX6OYPVKA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjkAmQAdgdPGxsK6coY/xztWnClsYupgb+nRfuWKON76PQAXqi
	nE/tFjlV4sDQwRf03vO7eiprvg/gh8vufdydHIRXPRRSnssWOKN5tiHxAwVpq+L5ct5Wk9q25jJ
	+NhFDvf1b01xIPT0D535YxCN0kjgARps=
X-Gm-Gg: AR+sD13ZlDq07G+azoPb5BkuAE1KWRsxxWmNkMGMvf9IsQ2Ko3RIrrn79oBZZ5jCbJX
	WALaAfyHdeOnVsd4wKE0ox/H0qC6BK6ufYyFaOtZEw0e7GtQJHh+eJBIbKJf0Pjfkd9HhmlsU9N
	nZOsPF9S0d8SNcOwxOcQngpP1yXY42lfkvugOPBzfo6573CYkRdjPDRCOG6HhEIXvZorQ7cvUTK
	SpkVnZns5XQuwInefdvlHkdPwVwXtiI6ZefZcY+ZxSF66CuAD0Vc5zzol+OAsRNZAMSWktxk83Z
	3qyGSiUr4jZMJMpRy/ewlsXyfnJs9JNVO+PUgsNF4Lz8BHjHhqHTjb8C1gK8ADNW1V5ei2NhGKj
	pvvVHOU3rOag1MctzpTmhRJ5bQuy6ET9qsqbrDFVMWEzHOI86DBMQzDGJUzHf0YBUi1LCkrZ/Gl
	/bDknEh0IVoomkkUE=
X-Received: by 2002:a17:903:3b84:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2d0ca712d68mr366857345ad.2.1786180442464; Sat, 08 Aug 2026
 02:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807065619.30604-1-phucduc.bui@gmail.com> <20260807070353.CC8C41F00A3A@smtp.kernel.org>
 <anYv8994aXbO4KU7@SMW015318>
In-Reply-To: <anYv8994aXbO4KU7@SMW015318>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:13:49 +0700
X-Gm-Features: AUfX_mwPSY660RKIOBLjbosaPstxVJRv0ueVC9qBdDXzIRO961xpgmRgy1fkHjM
Message-ID: <CAABR9nEnA7Ur_A2KycNV_26V5HmujuFG9PZeTQBPSLesLQRcsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for pointing this out.

> > [Severity: High]
> > Does this jump skip the necessary cleanup for the USB PHY?
> >
> > If usb_phy_init() succeeded earlier in ci_hdrc_imx_probe() and
> > platform_get_irq_optional() returns an error like -EPROBE_DEFER,
> > jumping directly to err_clk bypasses the phy_shutdown label:
> >
> > ci_hdrc_imx_probe()
> > ...
> > phy_shutdown:
> >       if (data->override_phy_control)
> >               usb_phy_shutdown(data->phy);
> > err_clk:
> >
> > Can this leak the initialized PHY state, regulators, or clocks, especially
> > since -EPROBE_DEFER can be hit multiple times? Should this be goto
> > phy_shutdown instead?
>
>
> Please check this, make sense.
>

I agree that this makes sense. I'll make the change and send v3.

Best regards,
Phuc
