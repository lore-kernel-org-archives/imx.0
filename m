Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA133F5A1
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827893; cv=pass; b=DKvcT6cRhUQDrCaFw8GdpULWnDUittbMQGwmYkKTnZPGu4rhBiyZKru9Nd9n5TuBuFWvgWSwv+5bZRCSNvtWYSTJl6SPdznsysVVY0/T5dGEs/423Dx8nV3QNLIPiolFlA8tPvEkW7Jwt2w59xBVDuGtrqGe+hLR8KeYPyqcRyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827893; c=relaxed/simple;
	bh=UUgvjzL0kPdTGbNwB37VUFMmIUWnQCmYrUoRtBHnBMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEhn6cBOYxXOYdDrAYZAWxupI3CJKzWZYM8lMP2LAWqFTdLwez+4f3hSKzlLMcGb8rzn6KiRrMLvWcfMhJ9KsaBduAAFPWX2EwO3BQ9tv/0kzB6CrTVARFEBn5ya37oZUViwMDlUZBMbfqcjK0E2tJH5OkuooVucAiF15ErjhEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4/jCF16; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4/jCF16"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso2052498a91.0
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 06:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827891; cv=none;
        d=google.com; s=arc-20260327;
        b=SGvNGY5FqEW7w+KVo/8lVbZ5y5M8HWjvuxOHY32mffmb3EXxFzJ3JVkztjW+QYWVQO
         jHPgZo+r6tVChjMayJxgYUvV6NbB48WRES2wn0M1XMFnGL0hk21qIpLYUrcbiyCq3TAW
         Ix/tIE8U9fh7pGKsJpUV0Z5yD7FeWNNGvGY9LhYVnIK7DFxDMIApeUS2k3cbM0mP00BQ
         mshOHULp4sgJ45ou4YrWAeVNKIwo1PXjkoGPQN5rZjKMSDNnUwGBLzYBgrbdYRqhI6Li
         f6+cwx3tK7TQ5qSuyiMfIZ5zzV6OIZhO6PsBlRcmRYTSxDIWo8fTOIVPrDEzCqtTXZn+
         SmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=;
        fh=xipc+3bqYxg87uwV+lHbRi7lg7zRwkvtqsFZEznIFp4=;
        b=qLGR0nLGpLdpOsi+ZFRxQ/axvjJ7PwpA0uLn0uclpaovjxcR9XoaFHRNzxzkwNzcmJ
         W0MKydj32qD1gt00/wKcAEEUA6H4mq187Qb1ahsEFj5jlgEEwJAil0Bdz4XStAz/E/Jm
         0Gy2tr0QLmhyONzPhd7+Ydz+ztNpA29YxGRUCZTiwfEk1HPXH3jcjNRwzDdmoD4oAvyg
         yS94p3jXiX+L7STb2GyurwqY82AB2aCx8aIUbVxSwdfuUh95PiYp0cqayGTVWtzkAHCL
         vV3TEwGwyfpcZ+0dD3bWrftcE2EiRUHbo32R0aG5xD0PqKu28MhSPdbBjYgVoF/nLJAx
         zg/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827891; x=1783432691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=;
        b=J4/jCF16Zg9SEYpR1SVj3iiOPt+Igqp8t2P6+LLbSTcxGsP9iYmtOLleoWx+/tHOnI
         WUoONbnAOtutE96FU4qQ42lHqowP0ZHksuilSpUvLrKAZXxdKfCbMqOaVVinuOhgwXQv
         zXNqNo1AZ1TTaxtXXNzjThuR5XCJG7yfSqyp93pDl9FutnRQxEqg9F+swVp4x8nTSD4o
         8nbDAVF0SKnbkm+b/6iec3+JSmg+2CEN+LCqVlr4DD5rzdlBkq8H/G0XJ+NkB+Ot8dCn
         jgCJ7xUw0mLta+wPL2nXJQ8mfaoSxVxE6W/s/ADx3PEvN8hP5cAjz/5/08HOH5AHOnAY
         o+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827891; x=1783432691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=;
        b=KXfp+kjkcCOS4qp2z1RzPt6lMztIKRe9Ahp1hf3/xbSKpIsZ9WmXAMdiU6DjPpWo6G
         EWgeahIkAPnIxydRH6RpniJf3h7ol/37vM37yQN7kFjf4BFe/U/4KithACLl6+XE/hrp
         X9jbRWhxfcojJwZ0M/uGf8A6Po+5xtAwyyJ+CTULBlLNQCrIPqAmcmTEwUOWBZ60JfA1
         GQg22Bq96el5yoMXoZdZyX3phEPRuy5AOfbExc/6IkUqkETQKZPjHlHQ3DOO8kFW+9qK
         IyiM6pNi5BpJ8ht3K64y3Brb/5Q5/JTm6RuPrWSDKsKLt68C2si2YFL6kGCTybRGl2bz
         Djvg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1mu0pZH1gCEC59sjRBNI63w0yLn7saOhxhF+WfaVgHfTA33Sp1Pa3DCRQXw4wcPH137o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ78abAyJrz+jfY56LoFdoMI5nLLaby4k4OiYga5e8tVA7cGRP
	Rx5A+RVygPrhPBtSTpnMSaEyOou52mKxslwPmfDAG//KVO6vjoVVjoHDtrrnCbGscRqfTZPG1Ro
	HoHOMRJTU/taZKn7aboTZfaMfXxC9K7I=
X-Gm-Gg: AfdE7clV3JoC5uYVmPvOCfabkcHO0KfnTeRXMlYetjpcK7xWinon38ZuGqOXTyvnB66
	3gM8g/emPX0Ie37SkUZBnTObDkK3gwThvubSln2JMl8UcksKfupKIFL8ZkPbXe65ReGeubh4C7y
	Iu0klYEDB36K2yt93hsXlMIj0vGOdP7oQQhOA/M9DN67Jd2DTZ4A4rL8xAKTQkFFoL9DKi/nH0b
	z4Ivza1u32z1505QYlN5HlYKhkorO4apQPjBSK/lbrlHju299J5BlUwZc1ZyTn9DQVKfAru8YLo
	PaDAkp7jVLXxGBMU5H0hG4nxSyTsqtHoj5ZnAA567F+dKqGtD+RQ
X-Received: by 2002:a17:90b:554f:b0:37f:9ce1:735a with SMTP id
 98e67ed59e1d1-3805277ea31mr2372294a91.27.1782827890882; Tue, 30 Jun 2026
 06:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com> <MRWPR04MB12330BE6893CE9A0F6702ABD188E82@MRWPR04MB12330.eurprd04.prod.outlook.com>
In-Reply-To: <MRWPR04MB12330BE6893CE9A0F6702ABD188E82@MRWPR04MB12330.eurprd04.prod.outlook.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 30 Jun 2026 21:58:00 +0800
X-Gm-Features: AVVi8Cf_KTraIW_3Ita1I0FfaOSBfOCUhalTydnfzUXS9XHlfuG8lIeC9Qbzit4
Message-ID: <CAN4SLj2F1Cmr4B4Ccs=H-eWj7EHYXmZsz-n=RPZVL_YxePwNJQ@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng=EF=BC=8C

On Mon, Jun 29, 2026 at 3:21=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
> > platform_device *pdev, const char *ocotp_com
> >
> >       ret =3D clk_prepare_enable(drvdata->clk);
> >       if (ret)
> > -             goto err_clk;
> > +             goto put_clk;
> >
> >       return 0;
> >
> > +put_clk:
> > +     clk_put(drvdata->clk);
> >  err_clk:
>
> It should be safe to directly put "clk_put" here, no
> need extra label.
Passing an error_ptr to clk_put() could invoke WARN_ON_ONCE.

Best regards
Felix
>
> Regards
> Peng.
>
> >       iounmap(drvdata->ocotp_base);
> >       return ret;
> >
