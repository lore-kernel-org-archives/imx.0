Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449F2FF665
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762335234; cv=none; b=teygsaHAPdvqgX0Si2wlWWYQV2uQdZvpQr/WrCND9y+cms28b6Pipa9s2RT6I/kOE04vxnb/OqYevnIpZ78DxXOx2zso1YblAGYSAfJp0xJJ++3xW7GW3UBLwYxpC6SddmqZ984w0o5jUKM9FIw6kcVuk77Ag8nUg0XZR9Ot0Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762335234; c=relaxed/simple;
	bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFdOnWn6vKKqGhHP4L/PjOxjyv2Yowgg3L6ifz3zNxnLcjnGi8dmLNtDbVLUxITd1+oYYOUYcYt2anDS9K2hyFRSCH2458MuJl+YSwdLrL8nuPYDzjgsCgaX8stZuVQcuK85opA9p0msm6SUZLS2QLoUWTg93zY36Vfuf1v38us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlrEQVeO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlrEQVeO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3889144b3a.2
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762335232; x=1762940032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
        b=JlrEQVeOFslEcuI4m1Nsp2O/noIhSOT0J0PPMFsQaIcV7A7ZzIqDHW/psX9sz+1/lp
         KX9SGwQIh9wZv0PIaOtMacmUQ/22G8ExZEcMXbPf1OnQMzPsZcRSxRVEfBfm0y2SQmfj
         G8qGnmJuC8z2ZdLTleUjKrgh8IrbXtW16LYXs54PfnZA1Fv06Y9zdB425B4EmcPdaoBM
         Vg1Cxmar5PR2pjujAg5Owb+HQSy75ygoyBhaDq2Z5rWx0oauNaLdPrOtJPkt+c3ziVn5
         J+1z/gefsJ6eZXVHxtFNx0x9HUdL3Ap0GHRPOzxefSQoVaCJ2Y0CgTNdeKtV1z0nSCEn
         XSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762335232; x=1762940032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
        b=QCvaPsCg4qvvFEVawcS4z9I5aNhwf6h4hygFWVPuri6J1dTTxccswVogV+2TS2nKII
         8JwgET6zv33aZ0qd6K/xsXymE41AhBGSRnwr/YcAwwrlYogaGKHT9qqazusAv7cw07bI
         2aZnIe8zFogFK6/Bek7PbhbypjwtfmIQsRJTJi+yhCPOC+PU0H8vZgGwndi5JZ8EVBTO
         9iU5EmrUg9VsssUSeoCmDCyLpTXIrUP0OC4gNGW6J210/FZ+dopQ+0Tk9zrJuf6EyxJ6
         r9o8jQfU0609A5H9htmrkMWzB1JfCEiXULYjsUgm23Rvc3Ht4O4OoUs9HqdDQBqSicTk
         W42w==
X-Forwarded-Encrypted: i=1; AJvYcCUraJH8MNJpNDg/Uqf8UpMCasOPffnZBVUrJgD2Ou2227Xj7amnuTOH5HY/L5hbop6NHjY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq+i4vN7g7wa+9btbo9Qh0YWiZ31hOqg5ROOy7eWxXDlJln6+2
	yC9+JfZ1UIrtCamE0cYGFJYDvLeA3pkXrbOnYjuCcTtITU6Nl0yHjnx2TxYV1rvLm9d70etldjj
	Y9C/AFCxOnKMsH6odXLnWK4fmQPO0Cz4=
X-Gm-Gg: ASbGncu4calOt05/n23cXNM1+P/0gM6FOzFGDvp8VNM9mvKjPtRaDlcB/9bJZuSAcy2
	lNz1M9MR9fwyfzf5dvuRgP5lb1PvJtOYHruRBjwqXUOvIu9N7F/mIB7obhBUCnRVdVHRybC4tGZ
	ETDe0P2q3tWX3EPek9kTC8f99ZO8/NToJ3jo1u2MOiTWGPPw7e28X3xL/QQ8U+VWMTOUIkRcbHY
	KG9Rh9ZdA7bd7+MjTHGgsJndZwOuOaCDPlpWB+QP+kHsM12ScUv2H89vg==
X-Google-Smtp-Source: AGHT+IFGxIq2XgduSb+stuaocak2phBxCIezkzwd+AAubIHJ9Z+vhmNDyViyBoMY0DIaLUkKe02kAuU0EhMWtzwP5ig=
X-Received: by 2002:a05:6a20:6a04:b0:350:5b75:6959 with SMTP id
 adf61e73a8af0-3505b756d29mr452994637.32.1762335231830; Wed, 05 Nov 2025
 01:33:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com> <20251104120301.913-4-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251104120301.913-4-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:36:19 +0200
X-Gm-Features: AWmQ_bnL9LXcRTfkqLXg0rjUqS39MT0GLWaNx8agMRC1jfxbVmtMKne3NHlmeiE
Message-ID: <CAEnQRZBENqUOTbdubTsNsivGtfKOqFqqTadr-jKkMGEwBvvnAQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] clk: imx: add driver for imx8ulp's sim lpav
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 2:05=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The i.MX8ULP System Integration Module (SIM) LPAV module is a block
> control module found inside the LPAV subsystem, which offers some clock
> gating options and reset line assertion/de-assertion capabilities.
>
> Therefore, the clock gate management is supported by registering the
> module's driver as a clock provider, while the reset capabilities are
> managed via the auxiliary device API to allow the DT node to act as a
> reset and clock provider.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
