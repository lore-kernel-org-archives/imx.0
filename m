Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997013B2B2
	for <imx@lists.linux.dev>; Fri, 29 Mar 2024 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711748687; cv=none; b=oB2KzpJAPoauVLvUfYzjABMGtB4ftpkhZ/zNLIEb4CiRXovt41WQPbZw1p7WoqaboyQbRgz/5bykI7IqUzFbxmDTszBp085xxE9DeLlFO7hAwOkTaueflItXh0DWwUh71qWInUOHX6J+KgMylLWJlvLkobmJy303tNpq9tZ2O2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711748687; c=relaxed/simple;
	bh=R0748x8HaAZ6ztcZqMARaww0FvPGRFQrV6Zx2gzOeuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJxSctwkIEfYvglsaxmN0hlUvb1+I839yIAnSVHfDwp88yG1bFL8h/dQX2PAdHxHkRIx5V04R9Z+cpqpDwd74rRhyLyiept71+BJfdx+5VoFnVq45p4UMgaqq2g7CvR87E0i1LiXaBBB5obK8AMkyeCXKeHwQmNG4qVNVn00e0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKFRHErd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKFRHErd"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4e47df06b8so19486766b.3
        for <imx@lists.linux.dev>; Fri, 29 Mar 2024 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711748684; x=1712353484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMjQQdvnAkpsaPKKclld6kAFP0Qb9Efzjh5DqJYyG9w=;
        b=RKFRHErdjomV7XO3NrKaO5ds4sVW3T0fPrB2Qu3EAZlmv8SNukJHdLBa0DMYP74ec6
         vNvylA+IKhKQC45PVk98yzwiSjV2kzu7P5//hBC8b2P9Xq/MG8WMeqlYPLveGYfJXYPx
         o+SHNXN7XalheNyV6Yj7iwUZ2haiCIFTBAz/tRu/AVnZt/8yt9kqPN5gnX7U06ehTPpG
         uwqAFyKbRZBzYBLrLCcW5XPbL1yEjNzzjueG3LilIPvfzzosFEfOX+qlX4NsIjGDPWCt
         0uRKDx6p47RuqlEaYJE9KxnknRm8wHQq/GusM4JPOFp0wLf/XAU7+d20SEaceBsnal8S
         JIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711748684; x=1712353484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMjQQdvnAkpsaPKKclld6kAFP0Qb9Efzjh5DqJYyG9w=;
        b=gF626rvinp4rqKtuIHTjlIEHItGP80Ab0bQ5pWu/ofIFlg/h7BL3W5rdke/egvVSw5
         BAME+ZNbqF7+N1JdXRMo5cHJQMmx3X3KI2zHv5uNkR77CPg7uTzQciEIs0WorTnMm3WG
         +5FawFNNkrJzbGh3WOg0CkrGF6gj3wl5F5p1vRf7zK7sYwScEvBL/ENI+akFRZQ0SKvj
         b8B04OgLeepM1Q9qL4Q+fYpj4ir2LTMrs9oHNvgm1LGAoMbpK1h/zPxGYS/ARO7rbdV8
         3mllVnX7+rvEnG2elRF9xXG0kEi1jLby+FF49GD674Gj6FpusFSVT5EoO7q/T6F5EedK
         Ef7A==
X-Forwarded-Encrypted: i=1; AJvYcCXmrF6uUeeD1PfA4W9TO8aHeDTKN8PVh23As8XeamVsp3ivSwbLAPbCLdIGEruSXtY2L85aF5O2xqBskL4SjABxDzhy
X-Gm-Message-State: AOJu0Yww3MVSjXzB2u5/Vc8fISSRaanv4to9Sha4TbHoTFxTIPzwMUjw
	CGopSz3tjASxINXhYEX/q8ORpJ72smVLBoqCmWXzZqpfDzHRsXeb2BLWpkEchEW6LRzYDmitrT9
	CGaARie6KnRuTLBz4Ky7ywoFZewU=
X-Google-Smtp-Source: AGHT+IGnzhTMA6HHYVX0olI3Uv+9/awh0ir8pNhdla3RNXl26d+VZIeHZUDWe+RJNRV+KqFpSStgls6l+6RJr8d/fp0=
X-Received: by 2002:a17:906:2847:b0:a4e:ce3:bb8 with SMTP id
 s7-20020a170906284700b00a4e0ce30bb8mr1939897ejc.43.1711748683759; Fri, 29 Mar
 2024 14:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328202320.187596-1-gilles.talis@gmail.com>
 <20240328202320.187596-4-gilles.talis@gmail.com> <CAOMZO5D7QG3sbtCe_Y3h1i0b1VaLXCftLSCkjSuXcso+dKij9Q@mail.gmail.com>
In-Reply-To: <CAOMZO5D7QG3sbtCe_Y3h1i0b1VaLXCftLSCkjSuXcso+dKij9Q@mail.gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 29 Mar 2024 17:44:32 -0400
Message-ID: <CAKcgs2wVe_4J-hYoMisoLyRv+roRsFTNXuvFjAP09uEWLOUpHA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: Add device tree for Emcraft
 Systems NavQ+ Kit
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, shawnguo@kernel.org, 
	alex@voxelbotics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

Thank you for the review.

Le jeu. 28 mars 2024 =C3=A0 18:55, Fabio Estevam <festevam@gmail.com> a =C3=
=A9crit :
>
> On Thu, Mar 28, 2024 at 5:23=E2=80=AFPM Gilles Talis <gilles.talis@gmail.=
com> wrote:
>
> > +       pinctrl_i2c6: i2c6grp {
> > +               fsl,pins =3D <
> > +                       MX8MP_IOMUXC_UART4_RXD__I2C6_SCL               =
                 0x400001c3
> > +                       MX8MP_IOMUXC_UART4_TXD__I2C6_SDA               =
                 0x400001c3
>
> If i2c6 is not used, you can drop its pinctrl entry.
Got it. Will fix that.
thanks!
Gilles.
