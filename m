Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C14448B83
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796753; cv=pass; b=p9L0fm+6N6oqa/MZNHdwsB+rm08Wo36SWEP4/w99RphA2ODZy9iY1s1SOX3zvREqCA7gnpDkE1WIeOGm1x0CmF2B+Zqg+9cXMbX5Y3P4QlmwqIejy0DggDCrQ4/eIbJKEDEpHTNgtl+QWVBoAGxBoWavl1XSi2qwjzRaY8A+yJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796753; c=relaxed/simple;
	bh=BzLE8AuiJudHf0vx2hSK9ysChmOCt+AKiZt7J9X7MUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkYfAiHX4kG33H8ndlGt69P5P05/pWavMyy3muRjOTmZxhYLyj4qsCtiSLcEvUEiDh4bjKFrT8vcin97KD+tFWVRiCTsIw+62oScSSUxExrycwEn2hez/g7DbwWVp+Zb5hPW24Z4VFhaMZh3utO8ijJj6IKpspsDz/KbhVF0LFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz1jc2nm; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz1jc2nm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso258684566b.2
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796750; cv=none;
        d=google.com; s=arc-20260327;
        b=PDITs5QRrgv8X+VWarzP4hT6nDrho+NXx64c/zz4TtLGeQsqrj+2dm9g4o8M5dyuzX
         E/JK7UPdRZ8aZjF7n6QIAqVqsVsAJ17c+Y5lf0NH0C/zeqQt9XtZGdUOJsQD1gYBOYn8
         YJ/DgmGNG+QLOc3iNc+P+hgDvBUR03kaTCbUBYRY0yPezGz8BTT1Q8csLb7jEhJVHR1/
         yA8PhCMRh5wR55YFtGBoH+V/OTf6iu+81F3sq+g2s29dYrutDyzq/M9lBLEkZjm3JDWJ
         mRrGH32U5UPgAzaWdI5YGevKrFY+rvF69xmUvpGmMF9BoXXnLWREEBaX5u6IvsEB/UHU
         bUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        fh=dPqAwGcOnDfWh2dgUOYmexp84QPvbiZgrsNs5uzSoWM=;
        b=YfRMJb77ogi/exPiUyic+sIhpEQnGTc2jAwfDPwmCcFRh+8OFEma3EPNvcHut11sSF
         VZh0XWoCizxkdtysgZ2aNuNcXKaBT1o/idCfVyIod9NuC3E898FyKRdMVcglD2MvZKPo
         KE3rLOgTseLHevRvhQAvHMWa3ZyqgbQ00p+Osi7tpQufHzWfSah8y7JE1COewVpYLvOP
         k613br+R8wAYFJe0qlSvV6P+arlF6XeMKSwjzdiMlKjvhxO64X1tZrJpedl+2s2wPY+i
         e+kHdmqKyVozpnzOJiBwLSvmZTOwITOM1/jzk/ouJG6U4PjHwzcGc/KygRRxr6zPgYMm
         hAWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796750; x=1792401550; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=hz1jc2nmOS+EUPkbUg0/z4wJHD6md5cpU/Q5pmu/s+vinyAHq1dPpDgxK/vYQFOAW9
         RQj71hFbTNkxSl25fzM5+TirZfw8wJGUn3ti8Swyc9JA8bHcy5EFf5jhA9RgCVSB0xRl
         5PFll5M9dUano9c8kyS0/yXTH1xMQg1QaCExry7g+7AMnCMWTwKY7on87T56XdMAEA6d
         cUmNh5wsKwmsV4QHttd/oImGaWEI++KBAALpgPhfw8sMwPftY/kBksxyHyXOxrPOwTch
         ApQJ7DHd6s7e9qObGeNaWCAFBRw7wYDZ6fBcZHMUMrrkdCernaH1lacVMtZe/LgwpUKb
         IUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796750; x=1792401550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=LW2+ib154N0kWFKjRWwVy4XgOIbEMcKp/+TuX3gy45h1RJ7/k/D+A47eCCcTBaFEZp
         ebpYcS4cS4Gwjk+J9g7Vl1egKXlnoeKS8CG3RjM7JthQBwyjNcsaQOMQgtrkB+Tp0oxB
         5L6NBXnx4R0pp0UMe7WAu3V2ygx3tnrb2f481shMtgmbcCIjFu6VKkRUHQLVhrjolbsk
         c/9Ar7GxDjl8RoGSWgJZkjk2G+m0wd3l1vTcmzSCq3ERFHWV2KtGYs3hc7UHqOo+Kw3/
         plBRTzpao6/m5MVinq7bH7AzSONQ7Uu5yr44hPITTegqAfoVPGJo2VvSoacriT4gKvdG
         uXrw==
X-Forwarded-Encrypted: i=1; AKwUvBwYPuLVMJ36R3uncA3sXFM5CvGoTvUXpJD85Ot+UHqJfNhoAsXqcVMxGjji6DICWsIF+ZA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJjE1ZJ7bmZEtFb/4Sjn0gaqvhGxlF2vCEWL2bIDkNDexnwsw9R
	V0+4zAQwWTXVGHwrNxsqh535DeRLIIGvNY1XU6zKypamIx0EELdaHwfNxKHGIL2VWBIiTtZRNyC
	IrW+LHhnpRxhp2CJ/zlJ8rJscU8Mu9U0=
X-Gm-Gg: AYBFou3ZwD1lRT80vz5yo2/BdULZ84ClVW81D3XQeINS07tfp2HAy4aZU8gGYBT3KJQ
	1FX3IwOWbYPWYnOQBtWx4Tws3v88e10F7iq8x/IW354BCTx2pATOxQ8IDksX+jq3+f4NuyBhgSn
	xi/3mqOswV6P5ZXvLOw0Bo4mi6h3c/QuilL7+YYwONO7wnIbbbitPfLOs+vzSKyggvhY2jM2SK+
	r8DtgSsHIa71180x4qIY/TQWU9YIA5+wkQgeptl3cg7guUtHFckDSsgl5FSozZsqXyC5B5p7ddt
	M75hAW2k7InsZDPITC34c8m71AY06rP3PHyevQSc3RnRl0sprvfTai2Va1t1z/Kg0VsgzzEpIS8
	lmB25KuG7ccQaDU5OlRlk1PPcJ1XcLiZOHGJdER46uVUsH1yomOZPYYu7nVxPDZhAZdoPsh9yHg
	CfQ3qWRgqgqrVkQBH6bIlwh466n9zjdnBHVLiJI1KL
X-Received: by 2002:a17:907:e109:b0:c31:e19c:fc4f with SMTP id
 a640c23a62f3a-c31e19cfeb2mr562736966b.14.1791796749871; Mon, 12 Oct 2026
 02:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:18:33 +0300
X-Gm-Features: AclHuK_t7SCC_fNqTJ9e7JfRmqFuaCbc-sDfdo-4CcqOLhnBhkL21_Jo8x7VqS0
Message-ID: <CAHp75VcWZSoMRvdBECyD5AM29+JWX=s0PORFM-QSMCNPD8wkCw@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] gpio: mxc: fix both_edges bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.

Is bitops.h already included?

--=20
With Best Regards,
Andy Shevchenko
