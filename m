Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF71B359F92
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766160758; cv=none; b=h750lJA4bdAEw5wbgVO2+eqTaml1ZZMdm3csnopulHMdUxmyT4V+XKL7WcPwwlvqWZoixagU0zofHI2tUJ3I+OeC3sOrYrZ7E8b44MECQL8/8u9s8MJhxUgpq2O1FjgIsCmF+moXsh0lBbltn3kCtB5E9cL+kt0yd4D8/9aNJ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766160758; c=relaxed/simple;
	bh=sv6Zjml6kSRghdP/4iiqcZXG6aBPgbn7q1pI3KNaqeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajm7OQJ1Q1BOJu0q0IXw1AXbBADozPfBCfQ0RvNaCmB/6puaaVBvXBybmVGo+xy+iWxUCCzCCAcSpMH5Xs3eq7Fbfhn5ghkbz+8u9jqk3mJNogCcJQHs8KDSAtwYecnT8gnD0ThMGWHMEhkp6Auql7nL43NNdDWTos9XX7AgYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g43Rj4Z1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g43Rj4Z1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so2239061e87.1
        for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766160755; x=1766765555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv6Zjml6kSRghdP/4iiqcZXG6aBPgbn7q1pI3KNaqeE=;
        b=g43Rj4Z1EpPZNTb2zHA2d3vD4a47FAp4npSx1EJWKmiA2mkolTJP12+eKNUex/qIPn
         ccuf42fzAP0vVjtVYBc1KrchGfXXqpTedH17Aau20Z9totiIPcKJTCwiAUQUZTrD5skK
         MKDKyP5uaJjShAoO5XxgnV996Zmru91aKtAjxFVjSInuoQFCs9+lTBSaOi+8HNOfh/Uk
         pLtorCFNuDtpdcoV5yIuKlxuVAlCtSRkgnv++V9dWl7yXFrDftdKF+hfnHKL8+e5iTYp
         sIqf1lm6H6tYyHnKzsbPVOAGdg8ppBoktgd0YoW2L18Lf6D+0cOQWyiYkMumeJnWchpv
         MQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160755; x=1766765555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sv6Zjml6kSRghdP/4iiqcZXG6aBPgbn7q1pI3KNaqeE=;
        b=rDqKjvssc0CQRDMRSk7Bcj8dLdUvA+96OJwZdnrl0GA7T1fxsmkapfAi5Rk8iL3/oi
         JUBdAcREVMegtvP/DD7GAixnFXcx/wHfL/1cECKzXMFMdScNSuaanQQRWW+4GB2pMFqq
         OTAO9hniGDaqRMlK3n0E5BVQaG3npLkB3zLLfTC2SQ/OGi0u4u3D5aBFxVU9J5GvVFq1
         hhkmyuiemWctOKjkKmS1DCMF8tgulBnFaizsbkYpVre8F8CsA/1bX78lnRLabrLRZy+L
         fMZs0fldznvt/AVymesg8MvEvh6bvT01c70sFHQ4PcpEiOYmADYVW7FZ6uzslU2WKW1b
         dZBA==
X-Forwarded-Encrypted: i=1; AJvYcCUJQfXbGVxmgYo9tSMNVmY2UmNqyGaG1hEhCfqJdReKKMHXmeLhmeTEXDmb0YYFjmnzN1o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdWV5T1Nn7fNx48VosAIKhHCuUXf+sEw82EQAW+BfDQndBGBx3
	roW5EM849OQhMl/pk61mBfQoWAw4lXVpwh6hV1T+c9UeMu5ixmK+i+lhxcqmtNTlSEX7f1fFNUx
	PG4E5dqK6pqF11CdafYW4XgIxj9QcaqQ=
X-Gm-Gg: AY/fxX5i8FBxAeKH9ifjcv9LJNxDRZxFwq+vn6xs1u6w/lPGSwj0IlDUAc/Z6uV1zHM
	C1ZfT60CP30leSHJR4Zp6Hb/YCxu51Or34U4iR6PrKe2fHNx9cNKQWONr5tSXYSOaJ956e2f/Ek
	Y6UguaBr1HdBqrAU/XoY4aLMue3JENdko5CLIJtCeoZLNd6gRPWdtpspAFRPJ2/3COGBlGw70EQ
	0Myh83Va2fTwXpErw30G9wh0Iq4AyLw5P8tB2W3Pj0ac2IAdhgC2J4r6hqNnO7xvxDnnmeOjKdZ
	tS6KbGh6Bj1dOkzaaC/Ma1Cj4QM=
X-Google-Smtp-Source: AGHT+IFobDJ/xmNIuBnlV91Afp+RQyO63zft36FqmBHS7NFSzYyCFJVjtvVsSpBZ4BEgaErptY3zx2JPBw13nUd7wwI=
X-Received: by 2002:a05:6512:398b:b0:594:3a5f:4e36 with SMTP id
 2adb3069b0e04-59a17d67ccbmr953433e87.40.1766160754637; Fri, 19 Dec 2025
 08:12:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219160912.561431-1-stefano.r@variscite.com>
In-Reply-To: <20251219160912.561431-1-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Dec 2025 13:12:23 -0300
X-Gm-Features: AQt7F2ri9IGuEvUhYZkj_tNSXd8nfyjSIkQj2CvvMpfIf6M6ZYJ8GQ_PcDG9l-E
Message-ID: <CAOMZO5BojiZe=KdNAtgc0iVhGENdbd4s-PKk8RPGo31KBkOnLw@mail.gmail.com>
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field
 before using it
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, j.zink@pengutronix.de, 
	linux-kernel@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com, 
	Frank.Li@nxp.com, haibo.chen@nxp.com, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, Stefano Radaelli <stefano.r@variscite.com>, 
	Leonid Segal <leonids@variscite.com>, Pierluigi Passaro <pierluigi.p@variscite.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 1:09=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> Clear the PCS_TX_SWING_FULL field mask before setting the new value
> in PHY_CTRL5 register. Without clearing the mask first, the OR operation
> could leave previously set bits, resulting in incorrect register
> configuration.
>
> Fixes: 63c85ad0cd81 ("phy: fsl-imx8mp-usb: add support for phy tuning")
> Suggested-by: Leonid Segal <leonids@variscite.com>
> Acked-by: Pierluigi Passaro <pierluigi.p@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
