Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13103373C1D
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529061; cv=none; b=U1Ov4yPNzZkPcBdiJyB4a3OGjCk4TDBW6Htc+xJ3xBguTNFN6hChzUeTHiaI/fsspyn1RQlFc7YqYeXbzoOO7Zne8OmBcDzblb5rkSkXmOvdl2BPk2HDj1ko2dDQgbwyuyn4pkmOKHdfDgVQue9dltBcRjaZM2KZZzFFUEHD6r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529061; c=relaxed/simple;
	bh=w8Kx1qlt4D62VcByjefxrRx2gnqxk8TlOdvwp54Diog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gM2MnfO3rHmg4CP6McwktNeCq330wtwnNSdHX+QFldg2eKV7vNHJxrdssv3NvxLih9lJdzJYbq7ismj227kUAgFvi5YKdwnr3s3IDo04UNmmZn6qQxdeb7NQp1Vmq6U4Vhsxic+xBTG45DPSrO1GwfOuhH74JlYa6ah0e5kSvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlAZfsK4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlAZfsK4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-827307b12dfso2931214b3a.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 01:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529059; x=1773133859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=RlAZfsK4Q9mKe7Knvr+3o2BSXvCJ+kiAEUjHcbYVB7ZhEGZpWzpmGB+aOrYd/Ky1PM
         YFnBHXS2+SOXJ12HgqbfUTpX0cBJzQygZDhzLad7aprw5M685bMogqx827Y3mg2SuGsU
         /QLkiECLp92JAvgUJccMMoVJ36Do8EjmvWb9WorvxmQAeJ4k0niEuYe+fM6fNUDev1W8
         SvZpRQhUHg0gtNUBKOFyssHKEZxWcbVe81CfHcxzRJVcvrbaJPEcmZDmbwdLd3nk4ooG
         26u+93d67dodldAyLa1o2MPGZlcJOeZMMvluP55Jnn89T68EidX+F0wRjdS+d3teaVTT
         zS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529059; x=1773133859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=FHZEMKKwkpBe+tR9hCaLP27Ri4C8vSj18p4YJBYgpsiIg1uYXb8rNc6y4JFXhMm5f4
         Hhx8dQLypnp7PJai/ccCVVqONffcPapUeraOq/ivYS6SsKO8/XcJLOpWG33yUPiU8lrI
         RnC5o896nF9SUYoybOu7+jzB92wb8mv809NdvoXFNzvYtNooLJ2bEyhVfuQ0VwcBhCTb
         VwbsjgAbWJWNaRQ9ugicLB9XrjXO/q5vNYzjIEKlRcucB4FwByETq8ulfLfXAXCP0sKV
         m4nxKrQGwVO8VvuR5kFP5PXl77OGW8+IdHlfaraaI0VaLleHfux1pGCCfR3HPZRdSC4U
         j95w==
X-Forwarded-Encrypted: i=1; AJvYcCVd0wQQUETFUgG7o5c9fjJJlUY8e+pDRW7ee7/mmv7HB8qpGMGJa58bQVGsDWMR3xw4EO8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOe/eR7da5C+9ytqLlz3VqQBb4Ui4ZHVfkGERYv8LEPjN5w0AC
	XR9sdr/nhqfiaaB38m7pDyNjHRaCR8qR/+22dy1xNKhCU7uiBQmDAtb5
X-Gm-Gg: ATEYQzx30YBafK75jNooWcrHWYFuMsivrb/WdieAmkmeeBc8DIIHGv6RkzSkxDsH6WX
	5YaNUa9+iAYgPhYg/NrGQy0Em7uwBF0Pb2qmWC0P/bQi+RMCaR4e8cEyfy65PqgQvKjw46HaXFb
	bzbjgR90+nvuXaksnnVSNd7TsoX07kAGmHqRf3CGyFOIA4a0dCjAO/1y49dlsccannnxVbSm/6W
	6CvvaBTLO5Pc2Wts6sqVTKqJI3Ef7rLJ8vM44KSEb2KopEfBdQrEQXJFoTi3sCtCen1X23gGlLG
	sNUBquLRVcmooC+BzaoaGgwDe7HeixyRRq9rMrkWpvd9BvO5QoNoz89xOy7t/eNpy6GtiSDuVmk
	UnLetS6M+jZXUizP8irYvhq5hzRUvuTw/Je8rVWsNmG+OpPMcLvk+ZdTJULl7/56yi8Ygdx69sK
	vsT8+23j7MIYIjcmokENJH8EK04StiGUrUgknfOO922NKMSjEEXhWMd9ad9WbSEzzlTC4oN+vzg
	DZFh/lQnIgcNNBY/4hC/qMiGaHwS4IJr0TEPoQtdjesGjcrIkJRpR2G5yif75AEs09xizzNqBsb
	Xg8=
X-Received: by 2002:a05:6a00:1ad4:b0:825:2927:3aa6 with SMTP id d2e1a72fcca58-8295d82a9abmr1551612b3a.14.1772529059400;
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db4955sm16000114b3a.29.2026.03.03.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle mode
Date: Tue, 03 Mar 2026 19:10:49 +1000
Message-ID: <4716405.LvFx2qVVIh@setsuna>
In-Reply-To: <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
References:
 <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
 <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Kuniori,

On Tuesday, 3 March 2026 12:11:50=E2=80=AFpm Australian Eastern Standard Ti=
me Kuninori=20
Morimoto wrote:
> > +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> > +			     unsigned int tx_mask, unsigned int rx_mask,
> > +			     int tx_mode, int rx_mode);
>=20
> Do we need "rx_mode" ?
> Only "tx_mode" is enough if my understanding was correct.

=46or our (Asahi) purposes yes, we only require TX. However, TAS2770 also
has a bus keeper on SDIN, and I suspect other hardware may too. Rather than
break the API later on should the need to configure this arise,
I decided to add the capability now. I am happy to get rid of it if
we think it is superfluous at this time though.

> This patch-set adds new snd_soc_dai_set_tdm_idle(), but no one is calling
> it. Who use it ??

Currently no one in tree consumes this API, and it is likely that no one wi=
ll
until we submit our platform driver. See the linked resources in the cover
letter for more details.

In the interests of transparency, I don't expect to have the
platform driver ready for submission any time soon; it is a bit of a mess
and given that I did not write most of it I still need to wrap my head
around why certain decisions were made during its design. However, we
are 100% committed to getting it merged at some point.

If you would prefer I can resubmit this series along with the driver
once it is ready, so that there is an example consumer for the API.

Regards,

James Calligeros


