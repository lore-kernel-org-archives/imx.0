Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E211318BBE
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308101; cv=none; b=ZmI2WMTmkeH3+V5c1SDWFAHElk6W8BElIOCS70tYHk21ATXg8T4IsdEbLqNW6EJmNdO4R73bAgb5bZv5mkhLIrmsjUDng6lZhYO2LIkaKPiC6ihhhyNx1YTtwJQOt23zE7t39LbkMoExTUlv4+hQYtA83NM0qZtepdoDoINz2Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308101; c=relaxed/simple;
	bh=eL7PVQngbIdVjMNaJ5hOZrkkQGnCOSIAXevP5xA0IX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/IvjsDHRrU3YaWs8nKj7kBxGmraUv3tjGMZQUnssoXzgNhOzLy7Zum4BSqPKJbcRFGpLrBtChhcr8KmFlAjYwiL55Rzo+aLlDYAGI4rDATxzBNhCRRBy8Fx6hV+qIt1J84tvX5sPxW3FR3mx4NowqvnbIs2rqdqMQ6jpZFhKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWyxjNIQ; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWyxjNIQ"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12056277571so8890383c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308099; x=1768912899; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=;
        b=LWyxjNIQOJ88qydEOX6UUe+6RBuFU4MEAc86gQi6CxWNJkeADHNemllzKAYdYiq34v
         HJkcZVLU+49xjpIpFMbyPTsq0c6hwq89t6OlkNSpX7+KJg81zjuBp6++nfq5M9XCHIF1
         P43aTFELirr55qfXHBsJwg8tBBonEWic0lXrG2K+rr9k0P9+9eQzSMc/wJlxFk/5Tile
         9hlnVnNcWDEku8g+dTKue7iH5ZU74wIZvY6RQqpKwklS+kR3q1EC4D6l/HQtQzSLz2V1
         lfQQ8orMdw/3PR7Qc8EFMSjTZyElbE0hzHUurVPzawpMpbSTrowx8yi48z69fNabiBu7
         fJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308099; x=1768912899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=;
        b=E5/7axzZBSzuNuI+gPfjaHo5msspifplliORwxy5OXqsAosKua7A+LFvGjAWklGO58
         /w76UYM9mGXJbWQqKdGYusDRsV0oor9eUR3JlKwslfvl2FDUYUJeO/xbCMM4WnvwAdYF
         rtstU7DDUpeIKbu6Euj3uR2z0mH1X3nPcqfParJcxlKWrWtojfx18KFuoML7oYAfbGDl
         atmh3SM+q518hm8HmnHOAz6fYgCFaNWsyYQgPYCN8HbEcEqdxejd746ZjHW7+AGzKK2L
         naz0sDxsxx3xtZPXba8LAwYIftxXl+amTRrsJxZg2IkG7T/JryB3AcJHvS4sTlPz8cnv
         mi5A==
X-Forwarded-Encrypted: i=1; AJvYcCVOUDWls3FDPi49CDUbhUGN9QDMywqXADcgZq6pD1Jd5QWkHLLKSD76CQn/5CSsi4a1eYI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/IO2RAeQuu66lGmsbEFOrX0nPz3sVRicxh62yCcLOrjwQ5guE
	oFOh1PUDB+oQsSSKOJTvbGypBMG2bHQces/yLjNbjBJ/t8PbuUB7fWjnFNVbkSdbCyPYLmAfC6c
	nzhh4lkUYsV7vjyYh6FraW+21rVzSW5U=
X-Gm-Gg: AY/fxX5gZc+gfu8ml7yYgVeHkQuODbBCiwpTJf369eIbOw9Ok1b6rcG2vadO9neCXIa
	CiUuM0PldsjylvcVHEa7jXdPhbjpW51FedF9d60Emyzzht3MKLDLgMSdXwDjeWh92qN0yvkhykb
	Ar39jNUyOkwGL/RouMiXvb7tWswQgywMq1eI77AEEwjc7tKxOQI0ujy2hKy1AqjfSWNeMa1MCWG
	WKG0YZf4NVEaWLqRDljBAfzCppLchJ2qvXmC+K42qVwxPjlyToBF7rl6IWQzsNahKvdrOd8tiQ7
	9Fu+TZMfqhkHd4gjHmrJXym1Ef9L1LAPfTkrFu7QogqnqPQERsfjU+cWDdksBiUwfFYf62Mm0hk
	gIPOVI6Mm2Q==
X-Google-Smtp-Source: AGHT+IGGt6V7Yz/k3MX0rPgRyPdKkJZSuXllz3mGtUOW76DiNPwxTi0xi3pikWRgsy1R8i1Svd5yXzdLFe/FFbB/yvQ=
X-Received: by 2002:a05:7022:6b8a:b0:11e:3e9:3e9e with SMTP id
 a92af1059eb24-121f8b9b014mr22821460c88.49.1768308099357; Tue, 13 Jan 2026
 04:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 14:44:07 +0200
X-Gm-Features: AZwV_Qiv0PmBxqAtHJLJya0dhZuXAfB0G9BuxIA4zBO7u9IIMz-d50P0kVBVrtg
Message-ID: <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 2:29=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-frac=
n-gppll.c
> index 579f76494eb041dfba58b8cd10eb2453a0ec4178..eb3d5e3c53946f3caf83bcff6=
54c6481611375e3 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tb=
l[] =3D {
>         PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
>         PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
>         PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
> -       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
> +       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
> +       PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20)

Can you please end this line with a comma so that next addition at the end =
of
the array will create a simpler diff?

Look for example at int_tbl array in the same file.

thanks,
Daniel.
