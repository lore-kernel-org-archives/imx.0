Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF93E4C6D
	for <imx@lists.linux.dev>; Tue,  5 May 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967672; cv=pass; b=Kz5TiZYf4kAPImhPqffiICCuwv3JB+X+K29QVD0eKtRn4aTUg0B+Bl1QoWsNQ8sufsiX5Ig7OXN0ANw3vWbIIRGU5dV2fNKPM9OY7kvFKylrS7HczfbrIWBk3I2w48UGzntxMY83Alq5yIoyb2q36Mylq9UxYqQ5mKzuzugBtFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967672; c=relaxed/simple;
	bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP7PW6Nf7pUUoriHKpUuy9FNIPclzUjnMgfPoN21LJCfm17fu1Dn2RQFdzLYSp1fTnuBJO20YLQ6Iy5gGjqdJo9VubW8qFwJ7r9ljTc5iakeO86OXQAec1gQwUAW1GCwL9SdMaOCAidnYDbRthtWwv4BIxCCNox/bJc7g/4WEgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWzMSesJ; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWzMSesJ"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65c364b893aso3500715d50.0
        for <imx@lists.linux.dev>; Tue, 05 May 2026 00:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777967670; cv=none;
        d=google.com; s=arc-20240605;
        b=M35+AoxDYwg39os0sabC7A3ME/ViFi6lhXQA7qL08xllpwMFJBRd1e47uGLwlEjnEB
         SnV6monf7yTAi6IBjE5OOWXhImoXe7gRFz/rd5KRo4vP/kc0oDNWTkMqj1REJaKT9hhF
         nBI6zQDB5tWkvMzJ/TA8+/VEQb/P0BcD34AevShg544B2ciKOITmKfnUy/ikgEgvcRaD
         tC53QibUk9awqaELE7ak38l6rPbLmtjrt0LID+2ZzsGnMH9jUnfQy/smuz3tr1t0FUTY
         tekSeS1QX7oaebLs3mI5Vp+dp229ZElxzWjplYS3NSgAz3MjVdHCdIey8ggMa6V0M1wC
         c3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
        fh=55FfXJzcH2PKn5qVDP+vBrpMOQyg3aryXtR5aVh4v9g=;
        b=NMKk8vqwhuJy+83RaSFQmcdbQ5QCfQoJ/LsiMnbJ1KLooENul5WxMZ34kVr5REfy7B
         +nW0BLYW+Kjla1WC+glM2HBFR3fWAVN74cRBS2NHierc/O9fABa6Q9nt5ge4W1Aq2TeB
         7FFskCNdjTaf4oQ0pdR3VnDnFxCy69IqV/X9maE2/5WjApQdc9u5BameaAll1UF1Bvfr
         EzoOZAzG6UISXprCMFcG9k1GTgRm6Klkb5XHrp30+91mdtGbmmK+Ji29SEQxL4y9NfAX
         rH63xLAcUtBdCNWwtnHQk1ituAIDSApM26mpx8h85dHbOF/dAP/3Z2t+fy2Ft9B1tIbA
         CrMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777967670; x=1778572470; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
        b=cWzMSesJewBmW6McBXDs76P82Ww2LkqYHlNvZG6xG7X2NCIpvtOJ3ZL+corn21M+ds
         4U6VsxkclV0Q5PKI5gX5eEXiN7f0QNkUrwYl9mcBknWQJ8Y5bgfe57/pyq6DdHcdhArJ
         L6knRwOCiLNbMGQuG66ffh26IyIuzzGlZBjwu49M82jsZF9av8B6EGS84nmMqNyHNRf5
         qNV8sQ4Cfp696X50XpXxP0mi9JrZp6A61hxeFhxZqY46Tpr97f7/fzgvlc/vi3L00zO3
         YTa3Rw5diBHvJy5eVXtnj0mGsHu+FkTgJ0ayJLn9oYQ3EKE18xJ8vaj8l6u+ALVBjSQp
         S1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967670; x=1778572470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
        b=M2GXAAe+ElwoVMTRPu1RPIwRfUEceZut8iPo5DRXJBtalCJhYFfHGow5ctJIc1Dldl
         9YJ3K3ebnjQ7Kzqjwd93CFH7RfeOdI1fXCxsNlJL62fKk0QPwhbUMz/RLdyCR9hC5FQk
         x0XrAwvw5yAbCqmRBDTPesIyzoCfHITX6mVOv8Fk875LUS5kGYGynogkrtueeFu4+53S
         HPWo5jLmhvp0hpHiAGEtDWj/AA05HlsITqDs90EoVm4GEjHb5R+xmNRWCLhmPqAwjq4W
         hbD2iPyzcjcHobQ1+0B8QeG8RpzLJopYUjf+ez73bvAiJJX2776QxMNgm2/HAjvafCSz
         BOHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OanHv972qhyYEQP0uM95jDphmcYJNHzbuui5ly3fsWIMObY2YMoJCumKBPrrvKtw9/jI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8qYxGNyxHdSo5l+xydU3nhYN8cs4ICd+G+/+tJWqtL1ILrcHb
	Ea6GWv0ljN0uDcFtuessuDrmFv5FQ2wO0NLJ888vrLdG2wXh/ig39hwKZ8B/sGHbPeWRhxBE6xk
	z6bf9G6NQNEtf47leCimj3YdtdOtqZ10=
X-Gm-Gg: AeBDievUuXly28BlnKq5forVDBxhbClHYUV16qSZu5n30x7Xd7rF4TfduoJdrHMdSn6
	Jkr55aITFKS3D2Oo39xCFcXZmwcyAOmPFEBPyItiRtZDAE7/EFTzhfvpkPdFyt8AtnSNptCOLGo
	fvF69IZdH6yhvJA3BFwqL02+eY22BjQ2a7hyNKJymgeqZZM59FzBOw58WA6t2qE1eL9ZmuPEatm
	WUOtXJmyJtfZdxlmALB7rz6TCPmNB7kHnEaN/KVUJkjoeN+s8wSnd9y6XicEIOIYGeA470ruT0+
	dsc85D9BkOStWlKJZ+M=
X-Received: by 2002:a05:690e:130b:b0:65c:391:4553 with SMTP id
 956f58d0204a3-65c3d972826mr13438227d50.2.1777967670455; Tue, 05 May 2026
 00:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502115528.530401-1-lgs201920130244@gmail.com> <afju2dg8fZ_RSD7-@lizhi-Precision-Tower-5810>
In-Reply-To: <afju2dg8fZ_RSD7-@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 5 May 2026 15:54:21 +0800
X-Gm-Features: AVHnY4LouAC2lU1dj0J8xcKYYWaYsdxpQJ4QBxgr9v4zBA8FqVVNp9OP76U4_MY
Message-ID: <CANUHTR8VCdYS1NdTXU_P1hAkCwiZ=pbTApv3B3ShLB678Son9Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
To: Frank Li <Frank.li@nxp.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for reviewing.

On Tue, 5 May 2026 at 03:09, Frank Li <Frank.li@nxp.com> wrote:
>
> >
> > This issue was found by a custom static analysis tool.
>
> Nit: needn't mention this.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

I will drop that sentence in v4.

Best regards,
Guangshuo
