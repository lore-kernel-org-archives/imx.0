Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229AC3314DE
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300051; cv=none; b=f+7+meDFjZdQSQyGjVvwSqtEM8IK7a/yknkuqRWezXAGsqTmSxFAK3XQm6Vgaz/D+Vzv3Yw7iI/3AUZeFAddsHGOpd6KsDM112KZ550/LJELvZlq/t6UTxhoXnY9v8DVGeSBzRr/dKrACyzqwqPLQ+AMoWx1OYMzRQ1u9f99syY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300051; c=relaxed/simple;
	bh=j9j/FxY93W6EebNy78ig35wmDS4XaSkKhbvzGGptDpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlEpbA70bgXSj5cWvxGFE4+5LzNRdd7f/accx/T2c0nw3ueIiyvloyFFiBnkYJ5oEKL3JaBT6H9Kj2fSCCsyN+sBDJgOjUcl6+A1Bp9ppfmNHQB/RAtSgxArZ2qH1GWMaM4AQMoscetSsrSByaaQvfVFBFDoX7G4gSBu9IGHxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMZVelk5; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMZVelk5"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12332910300so264499c88.0
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 02:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300049; x=1768904849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=;
        b=iMZVelk5nmXeYUfjK8OkAW9vVXTM5JSzXGO6osNM5ULAjkrQ+C5FNG/pyGKx8ApAWN
         ghZq9fKvKerCdYn1euMmuvVlZmAQmxW12jtdlE/HJRzlM3kWe1F24waC6IF4BZQ5dBKr
         A6UYqIWGIqZj5rTmchDuAB9y9iar9oir5fVy6lXRIj0soYmIkvfxnFYMqp5tztXvBraa
         ktxkBfPLU63NO8TVz60FRs6HCZ0hFYLnLmqx9Yb2AfrB1dfVs4w/RKEW/qr2awUffh9O
         WsgW+VzJl5hh5s27Ej8v7YSUelXpWpM1rwrdWl0f67cfjO6r1IxuEtBoEPpYCX8OjSW5
         WMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300049; x=1768904849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=;
        b=GmaVltAOTrsee4oYM1JJm9toTsl6YgVcF2rRJHhEewCKwU0h8TxaCpGtfhbz5a5vA7
         TaTchF0vsXgQnCfnd6DP3jdgobloqCC6l7I7squqt6hTzfkgH1Bu5Sot0rAwb5QRQSrI
         qjYptM9kPD7G+tRR4xlRI1/+j2mGJhC7kxy30ij72RO4+PXbYKogGOu1Rtx8e82mIuUG
         pgmndXE+kQ072IaqFEnFgrJJmng9BYuknluIgXFJeoQOBe+IUfWs5sZL0xRVzNT1ZKGM
         tyh9EaRqNrk1dYj/QsYVt2f+UNkJSEju7ecYiHLIxY6rEBCM7NUTSCuoBGZXObhbcoG5
         KD6A==
X-Forwarded-Encrypted: i=1; AJvYcCXD6/ZQC2P2+pP7dohT6JrOtgBl09pVXwHoif8Cn6y7t/lSfSodtWiawocb+RZuZcp8s2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOXpOsNjfAuPNNXgsUbgIrlk1vykYmqVy0zUASaHdugDlsYLqN
	ORQWjfn9ImOJU+5KUbCmIQj1+SHXYvdpcHq8h44ZtMuEwHu6GDWZW+mo8sVv7qztCMVONmAsWpe
	GaalSMWMB+5TATm2M0i3CYcLhelvkWYE=
X-Gm-Gg: AY/fxX7wsIwRjCPJszOMusvH/OG0PzJYKjaJIC+YCxEXsp+vuBOcgtaYg8gKVkb6JLw
	ipgGkGzaURPAeUdbuWErfrasql9yLC6pdCUhhClQVTVqQjKH9mZjxGP4x7lbLSep8XSOCfCDmqS
	5RC9B/e968BRUM5Ev075Ow+T8/v/pErDX7/KzQucwQ3V3fZfdkhhAb4HiR7vxiCSeK4BOa4oACg
	Hm3OeJu/ajwazzK7reLpxVbtbLi6AEHpybfqoY651u/spe0nWLG1ZMAlEXUspefuBjnVekDRFyj
	JFxuCVSth4safrHGNSCJmjxlFZJkqkJ0gkoIskpI3MBUDMQ5FTHhE+YqIm6MDPnsp2tgIz87ytQ
	JiO33ETEFsMXG24aGiQhS
X-Google-Smtp-Source: AGHT+IGfZnTOvyA+GnXypmSKKp8ss0rUr7qVhUutqVZTtjEFsV9r1oGBsX3My8UCe04SYXGn8hA8XADTEg/VbdC5KTM=
X-Received: by 2002:a05:7022:621:b0:122:9d:bd43 with SMTP id
 a92af1059eb24-122009dc38cmr17343117c88.19.1768300048919; Tue, 13 Jan 2026
 02:27:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com> <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 12:29:58 +0200
X-Gm-Features: AZwV_Qhqne5fRPBq_W-RkiEIzWVDm8CQPMcCvVpNRV8tzXEGjqNR0mdGDlyatAc
Message-ID: <CAEnQRZDjfyrcMj5ykvAQX1RzTMBCj-EaiM8SSKePb=6FyG+1cg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] remoteproc: imx_rproc: Add support for System
 Manager CPU API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:16=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> When the System Manager configuration places the M7 core in the same
> Logical Machine(LM) as the A55 cores (M7 LM ID equals A55 LM ID), Linux
> can control M7 using the CPU protocol API. For more details, see the
> previous patch that adds LMM API support.
>
> Changes include:
> - Introduce imx_rproc_ops_sm_cpu for CPU API operations.
> - Reuse imx_rproc_sm_detect_mode to detect shared LM and set priv->ops to
>   imx_rproc_ops_sm_cpu.
> - Implement imx_rproc_sm_cpu_{start,stop} to handle M7 start and stop.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
