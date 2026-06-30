Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC681D45E8
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782856055; cv=none; b=nKgyCC7dTbZhAOa67X41EvMdF7c0hGs/gBk8r1Q7mlG09Fxbd92sKsGdcDskotininFIztqfuwnH/Ixvhyyem5fFgWGdzzR32q7ctybyoNb0yZ8sCo1h26yS3P3YXoZCQtRReq2y/cVLZQFgvIbt5GGX53U6EdjJaDp1/SLgVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782856055; c=relaxed/simple;
	bh=Y6VjBS3HyRAWX5iZeWFYWtKTx1dcO8J8PTnC3B9sF1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ww9YcQQZb8K3kRvj5qK8EZ9miEdmWeJajI2uTNYHyv8WE4EuwSxBtl0dM9z7Bf0pZO/Bc/YL81I0zKxJwA/15IhS0lhgxCOLSZjjXelZ808700C0H3uxy++szp6qKjrUtio6YtXBCRx1NbXaAtZcQnZTBU0jnYkR65n8Lm72R94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9NGkgHZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9NGkgHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70951F0155A
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782856053;
	bh=2JxJYxohjUwYJZXlwl2tLOoasJsXfNDAaAFi3yYBE98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y9NGkgHZLpaRaQ/GYEiL6lK3CAMGUofQgj6W749BCmhAJwGfv7PfPOzT0Lrhf9wjJ
	 odK6K1HXY8GRgj9N0Sr7mmgq0f3iFRok76msFEnfPsxjMEo6RZQEViSTYAL6veHifz
	 xuSoGxrVGpPRx6LldqQUky3tXsZaFP6sjDlLALL6dYen6EzJbGI/TBQ76DExATBq2Y
	 7m+anBtqBIyk8bXp9kkzI+Ybu4R2I20wbiThaT9wIbS4UgPlRNGZ5mPo11lNsHIa7n
	 necjaN5baTVa1Ncu9tnTWyy6NvA/XMLVvhyBTV4bELdcdzANXN5pT/+kamfV54zJHE
	 wz7eCnP1bsnlw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea5e2a361so3398850e87.1
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 14:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrwoLF12gZThbV8XYlIblLFfjwH+JzpapC1A9UcNsFzzbC7hcXVRLRoNdGzoso3JOQerOk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy4GvebDnfpbZ2/q9ijAKtKbsUATBLhMRQz80r5Ym8jF0YsN+x
	diKM4Uss+Wwy/6XTTWxD6EC2Ukzt5kFJ2jow8VoU9btpfqU7HCAjzBXLdnudOnqwoMFjCAYdiql
	VREJrPXhp0ZGw4GeKrlccoFY/wrzZ6Rk=
X-Received: by 2002:a05:6512:3349:b0:5ae:b24c:7723 with SMTP id
 2adb3069b0e04-5aebdb8affamr1374084e87.17.1782856052738; Tue, 30 Jun 2026
 14:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 23:47:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmx7sJCsxMOp63OfHzBHL8Ps7i7PAQK=6ebx-e05rzcgA@mail.gmail.com>
X-Gm-Features: AVVi8CfiTow26248TidhGIW7dw9G825VZt5ZIC_cLTjC4s5J8jEFZkDnZkIzjiU
Message-ID: <CAD++jLmx7sJCsxMOp63OfHzBHL8Ps7i7PAQK=6ebx-e05rzcgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601
 (should be st,stmpe610)
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 12:37=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
>
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed=
 to match any schema with compatible: ['st,stmpe610']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Fixes: e10038ce1ba9 ("dt-bindings: mfd: Convert STMPE to YAML schema")

With that added:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
