Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E002D3750
	for <imx@lists.linux.dev>; Sun, 28 Dec 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937120; cv=none; b=PW/QzhLA4AAODbdvWfwWEjyr/FmuaYfr14hqGD1pHjZcFwCQxmMuix8Armr6DRgNVD/y6bOX5djDQ1hDe8SMCWZarlh0f1ceeRiKXvzS0YCjbR4pq0rBZcbEzhP7PV+9paqQJJrdYpUvF1vWw9dyh0G7Triy7h4bs2yGU0YkJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937120; c=relaxed/simple;
	bh=Fe6KnB13Ls5dHY9O1D27EZ0qAE3PZZJ7I6YiRPmbAWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3zRx5KDBQRjqRYRGwjCTJWrZ+6Pz7roH/LMRKdaIciS44RFAuSGrtMO9Ch1v8aHZBHhJMPFMhg4TjAmW3l6IubQDeQSUBz8atu97FI92ss7un8lqGxf6tYfReNAjNNLMmmQk7fIYuuJPruq90QRjZty1sm7TP63JhpF5YzLe+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGpVNtXP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGpVNtXP"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-598eaafa587so9590785e87.3
        for <imx@lists.linux.dev>; Sun, 28 Dec 2025 07:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766937116; x=1767541916; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/m1vxR02WOyUjv42kPGF/giy/R0/NhZdgtsGDSOxAM=;
        b=lGpVNtXPO9HLhmZRXJQuJc85+ixlfIn1kH/6FNdEpQtsL5xPzVbogDdu6xPEPigORT
         iyRqztF4iuKxiLx8pVoUT2BJ0qjGfmOeJwXZwI0sf/IY+uMDBlr75j/Pev0bjWjWcXEP
         yxvGZ4i7+jz64GKvVwm3gEhXwk/eN0zeyX2anUtf/AFTyrQ/Zp84jULmre+Kvb6wHwLX
         sbDbudyo0ynQuXy+NyueZu15R4Ifkaj9LdRl7NCPdGvVT+NZ3oe+yFB56+3DgPO3zJI/
         bJpphx44hu4dKtLrcJSyQLC2/VcJDwp0bDsZkxvn6y5g3TyrTMrgJeMvJyPLFKf+ZB0I
         9XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937116; x=1767541916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/m1vxR02WOyUjv42kPGF/giy/R0/NhZdgtsGDSOxAM=;
        b=ROGFdDdz0uVl8+uZ59vVGzgbJVMVtiz55sOuuKwW0XWw40HpsJaPUQiBN56eRdhXkI
         4owncyXH/zY1IlNW0XeJy9FbGeAtx3vl4M/J4VckcS8N5JWrTdD/5s3F88HfK8nWN4Gh
         P2UgFCP2CkgGug7s4Q7xpwP8N2mEg0PqFoydZ+zxB7eqhZE+Ud/z3XRC/WoIcFLeb83s
         RlrcTTBcndPG8yZo+O7DBQZvc/v4qQgsE0SP8I++a0pwc8WPOQT1YGh5yogLJ94IPPkm
         +N2tUQo9Zt8J9Y9BbYaxYqRsXsXoRD3TPu7tXsq66XXU5eSA/l9FGlY2y+XB/lYKYgiS
         hTQw==
X-Forwarded-Encrypted: i=1; AJvYcCVuXZgcxi0f2G0xkQF+sK6Lp1dXN5FZH1afjQzG/EcD1PUVWHWds8dcDDg3u4IawzRWHrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG7zyX2hdO7C4LRW5jBWhuBwG3fgi7Scoazy0GS16BzKE+DE38
	dGC8dOUxmBl+Z9s1Keczv7iybuBU8Re7RrG4uCL7w8wkkZobHzWLiVIKpzxzZ12I8ANJUXHTu3+
	c6JO0fJfr7jAZvkrHZQMKZBDRS9kPK3tN9kq1jx4u2Q==
X-Gm-Gg: AY/fxX5cuSYxpwqUfHfTgEX7Wri1NxHFEagsskWKk1AAjIVlNEoCHSHCYcnD3tnYNV5
	odc0iXst76HFdgI7Izt7do2yH66b7OKJaPfTav/DY+zDNxjxND+9fiSVS4SakKAiKH0IN7c5lPQ
	Jkmbcj23OsRvPZlEYewL5kySVKmwSqox7VRMjDDNIYsIHDjQECu0TOmhH0XEQmagy+Fm7W9hGB0
	FZIcGB69o2S3CdsBa+rZNgmfZfYSkRgCM4pUCFDXC+F6QSD0QXR73N0qhpksRzl8GlOh2BUY8AA
	/AX4p9s=
X-Google-Smtp-Source: AGHT+IGB3UutjLANyz+UGrs1Pqtz1ghxCPTBV3dlt5zsd0azNruBIQWwpwIrTOgY2yNs1XyuNUwLWDwXCb5ktjQfulg=
X-Received: by 2002:a2e:ae08:0:b0:37e:884f:b6ad with SMTP id
 38308e7fff4ca-381216725damr72755891fa.23.1766937116107; Sun, 28 Dec 2025
 07:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215-v6-18-topic-imx93-blkctrl-v3-0-51dbd1333938@pengutronix.de>
In-Reply-To: <20251215-v6-18-topic-imx93-blkctrl-v3-0-51dbd1333938@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Dec 2025 16:51:19 +0100
X-Gm-Features: AQt7F2rrgyY9PnfhYGRnz3aE_FjJItGK6XwPKeNDQpDGt15NF8-FEH9rM6gu3fs
Message-ID: <CAPDyKFqjJV8=PH7bTkWKJD4Dc7JoT6p02mPMrKA3uGuAKGsYvQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] i.MX91/93 BLK-CTRL improvements
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 20:18, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi,
>
> there were several approaches to bring the sub-devices population
> mainline [1,2] but non of them made it upstream. Both approaches were
> part of either the i.MX93 LVDS or MIPI-CSI enablement.
>
> This small patchset decouples the blk-ctrl changes which allows the
> MIPI-CSI and LVDS patchstack to be rebased ontop of this patchset.
>
> Before adding the sub-device supprt, I converted the driver to devm_*
> only API.
>
> Regards,
>   Marco
>
> [1] https://lore.kernel.org/all/20250701-95_cam-v1-3-c5172bab387b@nxp.com/
> [2] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew.tq-group.com/
>
> ---
> Changes in v3:
> - Link to v2: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de
> - Add r-b (Frank)
> - Rebase to v6.19-rc1
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de
> - Adapt patch2 commit message (Frank)
> - Check devm_pm_runtime_enable() return (Frank)
> - Add r-b tags (Frank, Alexander)
>
> ---
> Marco Felsch (3):
>       pmdomain: imx93-blk-ctrl: cleanup error path
>       pmdomain: imx93-blk-ctrl: convert to devm_* only
>       pmdomain: imx93-blk-ctrl: add support for optional subnodes
>
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 77 ++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 41 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251201-v6-18-topic-imx93-blkctrl-341220f7084d
>
> Best regards,
> --
> Marco Felsch <m.felsch@pengutronix.de>
>

The series applied for next, thanks!

Kind regards
Uffe
