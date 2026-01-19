Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE72DF6F6
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768857869; cv=pass; b=Pb59W0gcqeDSONld6kTdVw6bleQy57WdNfMpJ+iZfOPL6NCtFZ/0RL6N+5F2IIHO5j5cll4c1TqlbsWoUHvbx0cLHIrhPON8Q6CmWxZhzCj149O4NeCik6zLjBH5h+OlKFzRF1hYG2+TQ6fDWOc6pdAu5jCZSmJ8LWOx6ULipPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768857869; c=relaxed/simple;
	bh=P564zifxGq7gpIAXiYMGNHPdZBZ6qjwcGkLD/d5fbQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Js2E4THjBN9iwRyrdxpf6xSM/mTgOMjAlTraC3puBLHQRcPonehBkbNplfn7oc9HVyHSV1Dfg32VVEdB9ICqrS3SFEfwgfZmVE4OKbcWxpzwgBi4NzZe1XuxF+uc8KmD+Hd6U+qd1NxDCF4ADBwVJR4EfBeCGtI2CNhbvwXd+ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=cM+HZDqo; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cM+HZDqo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09d981507so35621145ad.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
        d=google.com; s=arc-20240605;
        b=Nxctyq5MyvD+NQ+gb1NTluZPktj2OLWLfuITpPU9vRu6+RjGp2d1pdB0XPI1kYWyxz
         6b5YKzvlzeD2wOamgKTS3Wk55sgd2LJ4D0frcwkyQi/arciyLuiBvzllXbO8G9iMRXQR
         Blo3+n9uHqn1fOZt+4rDGjqyT+tqG+LXB9BvjlqjDJuhLMAvQh18KdC20PGKctO+EV2p
         7fGYWdQ0iqPqfEp8Q+lTAOkpeXPUY5qII9htmcLfWw3+Y0v3CeESb7maSwZ2tE+cetqo
         Euu8fkyxMKJws6kKkgUfYV1Dutih26b2ffOnuO3u2yK84zYQbZ46yNCU30faF+bqW06a
         z6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        fh=I6z+Wtl0RG0EeGWqm5zEPWpG8rSQy51Cz7pAvwp/MfU=;
        b=lr33ao5oiaEVhanYrmKXwQC9/VdlH3mgktuiMtg8Hpd6w3n+oqvfi5+MvMThoFo7XL
         FYeMcwFRgUsrETxHTq4ms8ugY8PgtjsvkdN9GLraoohNA5fHo0qhskDxFNZUlOx6lrZK
         ka94MbvJbn5wdT/7JpwPlaK6kH+JdrHU3y0ja2DGsscNn2ybUF6m7E/GfwjUcz8KsPne
         6sVmMACnK33yMwQBb0rlqhqBdW4aJOlf6/CdmgkaEelMopf84ptrLA7wLgAkTONNbWqa
         VDP99V8/hLCLEFZos5CeXF7S1WUX3aZXH2TfZ2Eh/USp8TPLJSt+/4Yj13lw66WuzeZH
         3cRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768857867; x=1769462667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=cM+HZDqoMx1cPUuDn/WBhxj++7Agq2XgYQZcTOzMRkCSuK6x2HXUzn3eD+mSEguOhw
         npSKfqDRC+YOBku6PEVfLMJc3W4rI+egHbtlAPezNlhUVgexDDNu6RB49NIN73FxUtqf
         iMi12Qeasu5bu8frikGBIId+IqukEmhifTYTJEvWi6Om4V5EZOZ1cinPoifrw8KnRl/3
         3mN+WAw2R5lRh3RGidnp98iKe0jA6aIP3/3l9q/SnKL/ZwOQ8COWr2Dn/r2Pta0K6Pa5
         XAzmJBKwf0FsbQacayiYE6D0spnBIA2fe7tUJcYcba+9xcvJne6Z4/ka1xxYGGKAceeJ
         8T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768857867; x=1769462667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=JRTHPE0UoIHE3MiWM0R6i2vMky6ekt7rkC5oHHXGZ3inDbT8djo9cqMMfOqVXa0vgp
         FGJaaPUZJeaSDIU45lEAqDn6rm9zjFzNjR5YBi9AOXLckrz2ZweZ196O2G5mXUYfWznX
         vaNXLashZrvjSMf2L4kY8nmXUd4WPmKZRGymR970CbHnem8nNrKTpZn0oz6GaYmhnawJ
         1o3vrDA8476006K8Wv86Y7CQ+/j/pfFca0yN0j2QFI8jLjBJdlK/YaOpYTLc/3RukgJp
         Q4Oi1w/8orV+w/UvWS0+YB5hWwvv3DF2OB1ftPk+YHo5AGQklksZZN2XIl5H9vC25twA
         VF5w==
X-Forwarded-Encrypted: i=1; AJvYcCUZil1NFNccuxNIEZmpJFNtYAEy2PiQSMRQ81eOV5GRQ+Y/soJZFRcyFNcHjed7525P4Sc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw38ThlE7AyyDsBQ2mGJovr+v50zGlIGIXJLYLTU45DIKSVbrPw
	7JlhO5HxuLalEbxPruCIHXhos0ekmzhES8cMFbIUa23LT8VVPydd5nKgpG2j2LIVskbwjVuAmCL
	l/VM8ROiPTlhCJc2cZ+CdtkVpGoLQXLA=
X-Gm-Gg: AZuq6aLpw9vFWkKbdmS4bSbnTNTqOMwlgLi13XvaTfPU0VALZmcG7Ry1AQZcb4Cev4j
	nNAvsH45EHNJJrZCEjhjSJohBN9IyQB+HzQPuiovWOwShRwSL1muIiBjYvN5lzk+ycd2pwtGKmn
	UkES24Xcyms4wIYN/vrOLEmy41hH1QmezsgMf/2kLhJRzvdS7DxSNbTUR0ympJocaij+erDNqkf
	ndaMGlZ/AQ/vPnb49xK0Clr1t18X4SnSTXF5OzqrX2KEEMnBEMOiz5+/UsAGwFU+pROfYwKL7/L
	m/yxbFiG7eWm6+JwlDxbCzj8UBEjmdziZb07vwc=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com> <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Tue, Jan 13, 2026 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> >> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *d=
ev, struct device *master,
> >>                                    void *data)
> >>  {
> >>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       int irq =3D platform_get_irq(pdev, 0);
> >>
> >> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> > I have one question (so I can understand things better):
> > is there a particular reason why you went with free'ing the IRQ
> > instead of "just" masking it (so the hardware won't fire anymore of
> > those IRQs)?
>
> One reason is symmetry: _bind requests the irq, so _unbind does the
> reverse.
>
> Another is I don't have the hardware, so I wanted my changes to be as sma=
ll
> and clear as possible.
Understood, thanks!

> In principle one could request/free the irq in probe/remove and then
> enable/disable it in bind/unbind. Whether it would be a good or bad idea =
I
> don't know, but surely it would be more complex and I wouldn't want to do
> it without any chance to test it on hardware.
>
> Also, that would only optimize the case of multiple bind/unbind cycles,
> which are not quite realistic without bridge hotplug. And brigde hotplug
> does not exist yet in mainline, and when it will arrive it will be used
> only for a few use cases.
>
> I hope this answers your question.
Yes, I was curious whether you considered devm_free_irq() as the only
"correct" approach (in this case I would have recommended a comment)
or whether other approaches are fine too.
This is useful knowledge for me in case we ever need to restructure the dri=
ver.


Best regards,
Martin
