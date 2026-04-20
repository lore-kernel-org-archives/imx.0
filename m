Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5E26F288
	for <imx@lists.linux.dev>; Mon, 20 Apr 2026 02:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651588; cv=pass; b=oOqMG35C52kCzrSgmYMHCCF79mGMJSBAEIDw2rluv1Q//m13Xi72WBQkL24NbO6jZLAazPrchhAEXcwGU+KmrJlfjFIv481KGO5xkUfFyYLOnzcNHTTUPNfezmBu8mBv+KJsCI6adNEDfSdUEgn9hxamYpU6x6H/2Tt7Ia3X59I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651588; c=relaxed/simple;
	bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f47xwJacNOOP3KfKl69G/hvhq7d7v6gYXLUqTmix/GK+X5FHo+nBDKgmExcOxTR2beNeylcfQPQpspH1D+Ub6w9AWqVFM2YxsCU28OCBHhCwUP9zM8cPHH0Eo4nuu16R74jW07cpL7ND8xr3rqbI7ok9YNng3y4WFx8Xn1UzrL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcRz1O2G; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcRz1O2G"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-650789b22e3so2703013d50.1
        for <imx@lists.linux.dev>; Sun, 19 Apr 2026 19:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776651587; cv=none;
        d=google.com; s=arc-20240605;
        b=jgVm79tX89lZtoCdUXB+caY4TRtSQCdDYoQvokJ1OIspCb7ibND6PQzxtl/60bobxy
         Qgscw4rXrmzS2hO3yfSzmeDIEXGzUK7D0/1/ql02p4b5UwcGrzpBTeo4WRcalHHVBUTe
         JIJMeq/9kB6BWg0m4NdLQrYvgPZhg9FeFEYrKllFGFUNRKo5AjwbQ0tj5Fcs8blduABN
         jMzPa6fTV0AqMaBhAbkArwnTczYf1h8qJ0ue4hNhtJp19bh+hUfJ4kWWqd0n0dkUck1O
         rZSoFfyE7QsyP1dGrTMfFE+IrIjdRGBkTsQzEna83t3dPStiU/DTbAFMZZHMY5pNGDxi
         UYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
        fh=dXI4/G/1DJuqrk/yArPGIGh9J1W3rHHG3f/NN0D5DzI=;
        b=J0IN842iqNLSGBFopkgF7ujpvaJ9za8ACjjYDb0iMzq8KkmzGd+vZ4Sch68mfuotgB
         TutY+l2+sQ5KwJLfkdaVgsbGgKGVT9coDtrbiyerw95lmwfazLQBNo26/gGiuJ9SNNIK
         8CDEqgfpx2SBQdfqEq2luvvOEzyQsoNZUrj67Da2nXbykn131G9ug5Sjc+JxirYGiuB/
         2gwno/vhieBL0ARkdCSaBoz7CZH1HZ+H8eF127lIneuzhTlrSSlQhUXE2x5f47AqsJPf
         QM5JTy0DF5L3vDbvpniUWPbfz7ZLcl8DcfRSb+4rDV1JR194D5/CMrj43y0hBBxsExlo
         bB3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776651587; x=1777256387; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
        b=bcRz1O2GFuuvLUpLzYECkduDF+/o+hxf0lJcTF06mxI6hyb9rSUfYFFLNfN7FvA3lS
         xbIES5o/XtPQxXZuWLDmxxapbwruZfoE0LDpBM/GjFlsDBOUQJUXQm8F3M4/EaT3PcbX
         NIyTB7ceiNWAu0fE81tpBR/yXWKK3cBlJPBUiJzI7FnkW37Dh5dAiDLsTvg+9V7Ottfo
         +gRCbnRRIo/KrJUP7dVP6E435A1OQeX0Oe3VoAt28FZXt6b6G7AyTatpXjFB58jNhTU5
         cb1c/hkXGBwGtNxISq7f1o5Vi78/9mVpTZWuAJ+iE63aCTEg2WaVFHPLxMXsChYVyc/8
         biXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651587; x=1777256387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
        b=DL6PjiTRfRiZAzBcNOvMYPdrlMIuErQeeFSRvBf+eRqyG6ZQN0eB9pOmdbwSaY8saF
         QpbRApDxI/4xsuSgyLpdHGsEpf+F2Nm+KCaECmutp7NSYX+v9EZhoCjtsDvJAgLof9oa
         +yXzGeeuGRghobW5DCXy2LZAIZMMh5bcZaqZPRBSoTGLvYP/qs0g2E9WSqvsk8RFo2bP
         tJLHLLTnIW7qfiR9QnNKivfeVtpuDemT1lA0p3c3Ver/IffibA1als/ijNiPAYt3ThAy
         oMzd6Ft8NpTH9MbhZo1Q6QS138JGQdWY8LSynfR+amISJkyanZmWYFnc2rvQxINIhyJ3
         8Ikg==
X-Forwarded-Encrypted: i=1; AFNElJ9Yv865QK6sbwx25QT6TI5PHba9FEY95LVZeHIjmMICQLipJNlVCi6oIc/ZDAiqIPuqBpw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsxeo5Fngw4OEE2yxxKiU/me0jiNiH16tXuetqVROayhxl/wRw
	W2i0JYZgLn1+12N2gO5RY6GHxi8zsHn1VKvx3mYinw4gYPp/7VchI6grEa9A9P/fh4hhriWLQIl
	PP9lp/OSh7hxFfLcIGjMCvHakp2MhrGI=
X-Gm-Gg: AeBDiesDtN0fwDcP8W00ZmgUfL7rFzwaKRiX+foH0t0KwKqrxH6DIgBO1AMotEtNVPV
	MFayzMwxXrMNi4wV1aeYKUIkreiGiG32yr3yewBPow38DPtNsgIeIw1mmep3/EVmLyKqr9rFP3q
	LNWyx6SXgzDRmGcWHMQ1MTtseJWgJtnmnGtLJ0qRnYUc+0UrD89kXXz7zurN+Kpa295XApLnbZZ
	RYMPaxT+7rxMACAc1cIlgaMi9Nm8GaHPxMCSKjPajyEC+zmOyK2VimovI6+/aDrbPCjCoZ3YQke
	kdQGLUzmH50SgCf++adG
X-Received: by 2002:a05:690e:484d:b0:649:ef06:161d with SMTP id
 956f58d0204a3-653107f8e3bmr7151345d50.12.1776651586801; Sun, 19 Apr 2026
 19:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260419122134.97529-1-lgs201920130244@gmail.com> <aeWHyhp43ZbgXwFe@lizhi-Precision-Tower-5810>
In-Reply-To: <aeWHyhp43ZbgXwFe@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 20 Apr 2026 10:19:35 +0800
X-Gm-Features: AQROBzCNElVyi3SqTu0MlhOiyhEx1DKejewgDVxgHgM7RX0rIbL7rJ3aJmlWlyE
Message-ID: <CANUHTR8FaXLX+Nbeb7+sWRF9jQ5SoBgWc2y_LVD38KE7TqsxeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8qxp-pxl2dpi: avoid of_node_put() on ERR_PTR()
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

Thanks for the review.

On Mon, 20 Apr 2026 at 09:56, Frank Li <Frank.li@nxp.com> wrote:
>
>
> Please fix
> DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
>
> If (!IS_ERR(_T))
>

You're right, fixing DEFINE_FREE(device_node, ...) is the proper way
to handle this:
if (_T && !IS_ERR(_T)) of_node_put(_T)

This is a better fix than handling it only in this driver.

I'll rework the patch based on your suggestion and send v2 later.

Thanks,
Guangshuo
