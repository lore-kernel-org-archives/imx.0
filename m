Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B64825CB
	for <imx@lists.linux.dev>; Wed,  7 Oct 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371876; cv=none; b=tzoz4BtUAOFacl7UgHp0Q/Mb6k3A4p+HPUHNkbfni0D80TP8XXfCMvt5Wnf+cIweIW+yuxwF3N+tshZETARSxgXeQ99f+IwYvi2yE41I6b20QYI38RDi6YuR6wUgZe4S3TMwv/Vtw79QhTbnPPkaZW2zrFJpXjvoRdhUyta9kg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371876; c=relaxed/simple;
	bh=9iWF+2k9j/V1bncQePbeK9Xh0Y7J4Zk4ncvSD7lE4g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeQ+iZpdMPam1eVZ+YgpAdqWw+31bnXWZQ2fE/pTUdwzWQXnPkMRmm8kSC0vPCTMDuDXihE4h2zNMpUcNs0sPNLeywsFs1AUmoXejRsqB9GiWyFMp9wZjY9hm40KzPRCJ7WZTivSao3fpF9tdLJysiqbPx+MkZcpmUkrChq/CQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhI/A3MF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhI/A3MF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929A31F0089C
	for <imx@lists.linux.dev>; Wed,  7 Oct 2026 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371856;
	bh=9iWF+2k9j/V1bncQePbeK9Xh0Y7J4Zk4ncvSD7lE4g4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bhI/A3MF4J0vNjSVGIxRV/vIYHjyi3kdn07CFLD7AkEg98TtTGDtU62NJHNFEN/qm
	 ViMZqu+R81HWoMzUo96YzsHjeHEdQWXxnGoiA7ulmQZUaYqfr0KCiheqAVOlb2TFzs
	 hHFewDn3BzcNh+R6HvrB8nVo0r0WABmxi/GawMl0TKrA1meI2W0lo1WbNUVEdPo3/Q
	 /fTVlavELpUnz+TxU8knbAVHhHxmQA40Q5ajHirQfN2N6jFg6LKDT26OSOk8EFDcpR
	 ipYmllBzZdaw1ZCDhfBBlEwiQo/9pIpBGZZ35IzFaD21xZVmS1L3Q8X0CA/wHqQ+0I
	 HZ3J7f8p2GDgA==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49dee4c5427so1587147fac.2
        for <imx@lists.linux.dev>; Wed, 07 Oct 2026 04:17:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwe6qlMwr1ois+7AAHpe0rx/2KwDtixYeEza3JrQFwGKBeFxT68fggzUR9W3loEwYpPQKg=@lists.linux.dev
X-Gm-Message-State: AFuF++kEd30FFuBuPgisJpCCOu3f693FulRfE80ZdeLYdi+a6hdAjxpD
	IWNIizPSxlXynXK+C9GUde2Q5QYdU5grQJpGYsxptu5RV6V9L4ZEq4nFwxNmlVXHBYSQhzowdkX
	cJVNh7DK6anTwH6VRXchrSOxemH0mHJc=
X-Received: by 2002:a05:6870:c193:b0:49d:d2cd:67f3 with SMTP id
 586e51a60fabf-4a2597076f5mr1839969fac.49.1791371855820; Wed, 07 Oct 2026
 04:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org> <20261005-scmi_bus_fixes-v2-3-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-3-34a51338875a@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:17:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXDbRRCjSREYvFWy235wm3NnrJembGG=AW22ydW9o+9A@mail.gmail.com>
X-Gm-Features: AclHuK_X36kw7cGl6aPVuSMhUZsTQjMCbHVjKMBdB6tTAhR1mtf3ophJkl6YKXA
Message-ID: <CAD++jLkXDbRRCjSREYvFWy235wm3NnrJembGG=AW22ydW9o+9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP S32 Linux Team <s32@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 11:06=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
> "pinctrl-imx" name. Standard devices no longer have exclusive request
> tracking, so the i.MX and generic pinctrl drivers can register for the
> same protocol/name pair. Their probe checks select the appropriate
> driver for the platform.
>
> This solves the issue that occurs when both "pinmux" and "pinmux-imx"
> devices that share the same fwnode as only the first device registered
> is assigned as the owner of the fwnode. If this owner device fails to
> probe (e.g., its driver is blocklisted or missing), it never reaches
> the driver_bound() stage and the system skips cleaning up its supplier
> links. Even if a alternative device binds successfully, the system
> still looks to the broken original owner. As a result, all dependent
> hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
> forever, halting the boot process.
>
> Note that the solution doesn't support same fwnode being shared by
> multiple devices and associated fw_devlink feature.
>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Reported-by: Peng Fan <peng.fan@nxp.com>
> Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f3=
2@nxp.com
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
