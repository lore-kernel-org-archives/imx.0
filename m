Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79430C614
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113444; cv=pass; b=YEHzCq9RtL+zH9aC0bcSYTIBFB6VFBlODA5hTrq+/qGhyElge1CUuglYSV2Ks9ENO2c7BYGuyAXaKawVrQzUL+9XMc4OoD2LmMRMHtaSUwd5BHsZ/O+YQ//tZPeOpwkMC+PeYwikcRhYs4Nqb47vrilZSi3Yl7E56gzJP8/dqH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113444; c=relaxed/simple;
	bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzKNYH6G71W8t8h9lg7XHBjQMh4r23c82Z45Y9th8WGGxwUUaH7ck5bWtZS/zXWNTcx+0eHjVstOrjTu3ULVT8DZxk1vXx7szU+NcxANULFFtbayQuESB4x8jjAG4iOXoGqY/M5+Y3o02NRqkhsRMUOqWSnG32quJVkDWqMf7QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxooHrkb; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxooHrkb"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124a95e592fso7924107c88.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 02:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770113442; cv=none;
        d=google.com; s=arc-20240605;
        b=LK097AZPz3XDEjgE6kIppHcIrzxM4jJkKqqcbWb6Z9jmSGK08GLTMclV4CmyuhqCQH
         9FpMizK2s//EHdKNRQ9IkXDuTTZcig2oZPCX7agh4w3dT8G4n9Yh4D/T8AwpHXEN73Dv
         J7h7CJb4PKdK61NGqewfGZybozHUUUe540daERYiUiYexyivSRoC4qMVgN2T3Tkvnsd+
         4NcIirRdiqZR5O9TV1J9kGjqhJZnsz4rBfyoaBW9qcH56kySjekV6N6l+e8znAPB3g4x
         txCGdYVUSEs+5HObgn+R9uKC/83cAXcUKVA8DWON4+k+wK9gF4t6Q47nWpOfw3YMu8wS
         mrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        fh=1LK7NqZbJiNURhq2FZBI2shbi7DoQBqzXAR2Msyt/pI=;
        b=C6/zzvsbOUUcnGjROp6NcwxK/MI4yLNkhJiukjcSpkFtYvQC7+7t3izbdAwd1zBK0z
         8vhqceWA/KDw4lkiV/hj5mc3M5fxsST6nnCMjEYQXC+wsRtWR3WALpbzyl0Pg91Ye0CV
         ZlWeCZgxm3MaZlESGYSVMkpsHFMAk/8BBS5YtVkECYhkw4xIG9scE+uWjiYqcKbH6j93
         8qmMkyHwYgZLhLVxzyHnQhjEzRPm6FTKJ4ovFHSeUwMRXcsznUnb5aJkdnSnu/XfWmKa
         kQ9Py0MTPCRnLRmyoCwo879qe3ZVnET/Og1SC4vQCuZU+TZMdtpzJ+KutFnWERuMmuoU
         O7mg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113442; x=1770718242; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        b=KxooHrkbvdm4gySwx486qaLsggZNvmWvqnoxphVFHAvnz6rXD1w7RXJ11W2rv/IUGP
         dxXtrGCWagMClOZ9NgF0zZY2o00TDs4dauuggLvPYedOiC9lg5c1nQevR/zUP9iQWyj/
         G2AaJUBGdMmeD/kELkaF0+yvnrQ0iFxiH+hv9La7Aa4RLlGpZFysn6cwkXih3oOAl/R/
         qWJbeHfNe4gusOK420TrUgojQD1HL+QuoWEbT+kldQtXxi0vw4FFcJPyoczpgcpXP4oI
         voTEdGaRsUEJMFl93H9QbVuh7cD6HBEiquxj4uOrXL4orteU08GoVM+X4R5uDf5LBdEl
         NIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113442; x=1770718242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        b=aPk1GOL3TFpATIrk9Nh3U8GeoQg+UiNIp70Z/XCIzulvyL6EdhRWlThhiwclEdagIA
         QBNthLjh4l6I9D37G60puzz/5d3ofirgoB4qby8jLZCUtel0G0E7f4PJuWbHIlcRt05N
         bRr+ps08ocaMBQD9j5Tr8Q3ptUsOfClDdjui6nOBIeIaCYoe3v7UF0JvEXYbW2XnosjK
         GtWq78yuZKTttJtLmBmkbFwerAwSbjE/e9AXnw6CwjrW1YTEUkqs4YYAxW2HWJJ0u5CG
         A7sBLf1tM7FW8jI95V108DK2GCo+5UH1KiuvINCFeBddydj4KzX5h8VjhguYMl+1OFK2
         juZw==
X-Forwarded-Encrypted: i=1; AJvYcCWI+XaL++OlBtZA92Maggp0e0krUr1ZLf1Jslum8IVzWVOTcB+oZ6QRsenGkTl+Py5r0Qc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFV3ejYc6v8q1y5Oh/QgJAXoRhUgbVGCJW9Yu8K/pHjqWrdc27
	tS3OueUktdFmj6jlRb7MF/8N6oUgZnNlhed0SAa9Eis47F2BIDt8B4bLRO6mhwIZWcklbfOBFus
	7Fu67QwoPUYpDwmfuBtO9PTATl7t3pqY=
X-Gm-Gg: AZuq6aIQfiToQtlgXskVjEOeJzK/3DqDfIlJ4MYETxvH3GRvgnC63kSB0tHx0WE/1zo
	jX8BAGhzEViMkBbzfUCYKdenMwfSnQUcdBEZrNvHQ27kmh20IodMfGF0+iVaVDO0zeEoOaGqjt4
	fRfYZ66YAYRdNgYZvomPYRGftstzj7CDR09vdZyoJcXXdhRW9DsUpfxE995OLiITzGVuYPV6EZO
	doM9ifpgdS8s3G6P4g2jABf+ovkI1Q9pokVlXpeeBj3/xpLdQ8QYkNs8OLrn2bHpMa9CTYpzVIF
	3dIYJLh1NHWb1JyIQKDP927yITb+DCuAeiSdo4qevX/a2nN8nP9s21s+qRwYxTLzBQobskvsACg
	R57mfS16efA==
X-Received: by 2002:a05:7022:6707:b0:11b:9386:a3ce with SMTP id
 a92af1059eb24-125c101ef89mr7226621c88.47.1770113441581; Tue, 03 Feb 2026
 02:10:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com> <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 12:13:22 +0200
X-Gm-Features: AZwV_QioJ69dZ07wlDN2xKHoYGFZyQ3lUnsqEy_ZM2pB4A9WwAjMHzHhAGnPGyA
Message-ID: <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: Disable CLK_OPS_PARENT_ENABLED parent only after
 CRITICAL check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 8:39=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The call to clk_core_enable_lock done by __clk_core_init after checking
> the clock flags for CLK_IS_CRITICAL enables the parent clock.
>
> In Commit 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during
> recalc"), the parent gets disabled before this check, if the flag
> CLK_OPS_PARENT_ENABLED is set on the clock. This results in a situation
> where critical clocks have their parent briefly disabled, which kills
> the system.
>
> Fix this by moving the balancing operation to after the CLK_IS_CRITICAL
> check, which should resolve the problem.
>
> Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/036da7ce-6487-4a6e-9b15-97c6d3bcdcec@si=
rena.org.uk/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Hi Nicolas,

Would you consider please reverting faulty patch above as i.MX8mp is
still broken?
