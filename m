Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6401DC04A
	for <imx@lists.linux.dev>; Sat, 25 Jan 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809925; cv=none; b=EVL0Gi97fIAY8b9wSoBOdRfsqBq5nG7Oe1yJqo3RkViC9EtA6WvnsKvDZCWzPY+FBD3MCV0Qhk62dJ9N+VfabQQQdqniJL03w/W5Z08SlSJiAbEHa41k7EKguX/WJ4EcKW+prC/ucIuCOlrhjcszDKdmfdX0xVD7HKNmYqaH6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809925; c=relaxed/simple;
	bh=7mquXriMeiqCrDQ4BHE4GQoKXdy1uMYdwhwW2GBfRlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9RGIk8TtUgs8xhtu65VJroWZX1tlKEWNb1ba+imvHOTJ9MFaegT5alxFmYSFr7MJ5I5SBQ0vFeZkondAnH8pBEA6yk3kZyZQtv2DXRPHHk0SOlThfUlsvCSnd/6R9VATg4L1F0WOUs+7CDiXTVYvJzojq0EaMuyeCKjfLVeo8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FltQTe9o; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FltQTe9o"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso5472955276.1
        for <imx@lists.linux.dev>; Sat, 25 Jan 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737809921; x=1738414721; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=;
        b=FltQTe9oIZ8KSAEFeCsMtsKOUUscuE9VKLb0KWD68nSgLN3v4c68Wcnlb9PUCVrnDW
         +ia0xutITVdFMI61tyWcwEc9bR9nu8UCgG1D13lfr6loAgJ+NzT5bPFi9wGOqKQuMJO0
         YQ3WIHua7uJQBldhyPUWrrX26Gx2GQmTAx360=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809921; x=1738414721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=;
        b=v4ssuEz6nN7ifsdj7GBxmrEGwI3FSyv3Ybw7JFPuhIyz7jYenUGP0e5dRJ//PMALjk
         28GHKN++gyeBMvPD5R2DNJJJHLj7HaCwmo0J1ju2N+ygveZ02b2aW0NG9kfPG7nyi3L9
         EtJfzX0llHKg4IRpK594/40hQOmqYNq+CziFSe6gwG4UpBOx7RAxXIx7B7VPINy42GHs
         +Ms7Lu2xcyuFcPEIWTaRZi+GU2O0yFcPhbVV7Q49rTfvuRTr+5M637we5+i2nAFpcTLF
         hSVWLl/wHLgWeVa4hZhG+DX7j365tlwVonNP9GKrKus/IDIwWOdNFGZVaFomZGJvv/S5
         zOwg==
X-Forwarded-Encrypted: i=1; AJvYcCVpj+E+MNDnMvU7EsZsTX4BBOHgCukbNmEU9EXR1PJbERJjosSXvB2hl5GQ7MWKXdh60AQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBUkxhll/DEsWYVwRjh3vNpO1DLltUEDmtubHyzJeR0jgX6W5X
	v6hsxKD86X/9LlCaB2AKnTUA+7p8jPzGm+u6P8dRA1ixp/H46Nmv4JiwMK68OBEtJrIn07qgC+V
	ZH5G29h2CNaaDIX6UbgJgesHuWzv0ZVdE2PgLPA==
X-Gm-Gg: ASbGncsJ1JhjXZIL9KhgfuO50sOphYJadVT47CH14zMGFYZOMIc8BpNzf1/dOovDfe0
	U4dY4HRvDznwdXi67kJzMkhFH1tJUG7f/fcqna6MZF1teFAIoqDOhOWDr94fz
X-Google-Smtp-Source: AGHT+IEEKpiikrUJ57qyfcCRA/e0fon58biS6P+zSfMgH8jo4xDtyN7iJdHR7Or74nDGVOsMp3enzXojTs8OVWanswA=
X-Received: by 2002:a25:ae54:0:b0:e57:cc1e:2ab4 with SMTP id
 3f1490d57ef6-e57cc1e2c6cmr17264809276.28.1737809921258; Sat, 25 Jan 2025
 04:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
In-Reply-To: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 13:58:30 +0100
X-Gm-Features: AWEUYZnNxDwCk6NAMaoEBBJdy6_TRGTFA2dlWGHDjrD3fTX9PYVK1omwdpabvIA
Message-ID: <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> - Introduce clk_set_spread_spectrum to set the parameters for enabling
>   spread spectrum of a clock.
> - Parse 'assigned-clock-sscs' and configure it by default before using th=
e
>   clock. The pull request for this property is at [1]
>   This property is parsed before parsing clock rate.
>
> - Enable this feature for clk-scmi on i.MX95.
>   This may not the best, since checking machine compatibles.
>   I am thinking to provide an API scmi_get_vendor_info, then driver
>   could use it for OEM stuff, such as
>   if (scmi_get_vendor_info returns NXP_IMX)
>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
>

I wonder if your solution is truly generic or merely a generalization
of your use case, which seems significantly simpler compared to what
happens on the i.MX8M platform, as discussed in thread
https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04=
MB8459.eurprd04.prod.outlook.com/,
or on the STM32F platform, where parameters are not written directly
to registers but are instead used in calculations involving the
parent_rate and the PLL divider, for example.

I am the author of the patches that introduced spread spectrum
management for the AM33x and STM32Fx platforms, as well as the
series, still pending acceptance, for the i.MX8M.
From my perspective, this functionality varies significantly
from platform to platform, with key differences that must be
considered.

Thanks and regards,
Dario

> [1] https://github.com/devicetree-org/dt-schema/pull/154
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       clk: Introduce clk_set_spread_spectrum
>       clk: conf: Support assigned-clock-sscs
>       clk: scmi: Support spread spectrum
>
>  drivers/clk/clk-conf.c        | 68 +++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/clk-scmi.c        | 37 +++++++++++++++++++++++
>  drivers/clk/clk.c             | 39 +++++++++++++++++++++++++
>  include/linux/clk-provider.h  | 22 ++++++++++++++
>  include/linux/clk.h           | 22 ++++++++++++++
>  include/linux/scmi_protocol.h |  5 ++++
>  6 files changed, 193 insertions(+)
> ---
> base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
> change-id: 20250124-clk-ssc-fccd4f60d7e5
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
