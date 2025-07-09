Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC011224B04
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752085710; cv=none; b=HpcsrYkzfN95WLiKRQlJvyxBtkyFuYiM4/85FDlxHDg5iYnodlAxVv60wf6ZPePIXs5dqeG7kQUzQ8xMn1vAy7PuIkscmOwRSegqGOFhI+43IVKZ7SfB2wY5Rw5Ic7waanHo0z79iQAcliH7CzaW0GeO23+HhtmUwpDtOiiGqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752085710; c=relaxed/simple;
	bh=EF3tKvm/yLMAj5ER680mB6JtKaeBj11j3qvBwe39Xuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNfqYIxfx6lo8jfiH1oJoLgeXYtADpCohJxWKsAhxvxl3URLA/WqaqHCWIjDLSBGhag7rIwfS7tZVT9MeUcdicXr5DcmotHMjgwkM4YXHU/G6WhqUIeXzSF0I2wLJaWSrpEPNDX8qopocJZnmtjUJvU3MaZoDS8hY3lz9Z+HNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=ephIBL7t; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="ephIBL7t"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2da3c572a0bso151387fac.3
        for <imx@lists.linux.dev>; Wed, 09 Jul 2025 11:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1752085707; x=1752690507; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF3tKvm/yLMAj5ER680mB6JtKaeBj11j3qvBwe39Xuk=;
        b=ephIBL7tnrvVpVuA+E/CcjFpJoXQNPs+x269CruLHsCvlGkmmWkqkEOgYS7PTC5rNT
         XfDgJB8BPxOy2RnHGQgkdvoD+IfVfTMbrcsssMj+bxO1xRz1HtP09ORbdqQ4qLGUyTcz
         O3Y70YLKlAo0Ck1vPj/FsSyA8qRMZWNaHGaJvyHvD8P+j1VPFvLXnipVWSeefVHO+P6g
         khN6Ru6SptJL+JUzM7Z0CnarQCPlCtcwOLj8Q22eTFZdD+q8FbrrhrILE0PgIgNA++eC
         QNGOBALJk0CQNmiE7DQ/YP0suUDeESdoFfU4eLi5YML7iI5C0l8tGPRF+uVMqVkySMt0
         p4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752085707; x=1752690507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF3tKvm/yLMAj5ER680mB6JtKaeBj11j3qvBwe39Xuk=;
        b=xF5CrR2EZRNxhaZ5PWGegZbv6aN9k1jZEHGCGMcJWnxYrDtUEUIgNUGzydJ6Qp6OGu
         tIFL/kCARK0DQZXR+4BhUqpFrHPgpVroOTU0I8iKL5h+eYYg8Boge/N9x8sACAnnA+/+
         erAKERtY1Y2IS98TNvDFrKM9KS0ZGwojSzYwPihQek4biP/8AAlETlotLDRifhALdBKI
         VUyLQ7CS1WgnWnDrM3v3LhD+QpygM+zhlTkt148U6RbLcHllqjfoFDqG61XWaj4JIxTx
         RnqGCdkYBnVhjYhpep+HTJ5A3N/CE/eFpZUdz33nmBMZaNTpQoPj33qA16ZJ4uQGvM3s
         omsw==
X-Forwarded-Encrypted: i=1; AJvYcCVLaJJrIMdclI4tiPpw9aEWgaAIRsCbt5YrI+1pAA/J95holPiifT7mYp2rEH23xm+AMtk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCDK9HP2JYVnDUnvKBkn4V6zTA1WMxkgz9EJqsBdyPGi02uckw
	42Cz5UoWMTfS9Uq5WmfSMG+3AXikXkYH2myrwbzFD+m+HQIfWUHGob5jYW8XYeelEMkTA/jqy3U
	yhjfBSrtyBmCdTp8aOIXTZLwOWP8dDJagasQFy/9Vsw==
X-Gm-Gg: ASbGncvWXo5Nu6wMMzP8sF/RSfNQPb8lHUdRmMjsvKAExRab8eh9ORZHVI64K25rud3
	xlxgqvfwX9SiRjv4bFGpR/FiRXSADK01WkTAzOcYgijkbChDLQDPV3jTZPvDNElDE7Z+pW3R/H3
	JNDhxjaSpyBdxbq/GnKNkdGr/VMmcvY2YDLJndEVdUJfc=
X-Google-Smtp-Source: AGHT+IHA/hKgmN+ZQ0rDeLHDX1FbU4i9gta+XOUEkPAn4h5OjDz1rrmG5m9UAzx1iDyyI0XUhyXd80xd6NkdtMblp0Y=
X-Received: by 2002:a05:6870:3329:b0:2eb:a8fb:863c with SMTP id
 586e51a60fabf-2fef871c3b9mr2622993fac.19.1752085706812; Wed, 09 Jul 2025
 11:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
In-Reply-To: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 9 Jul 2025 11:28:15 -0700
X-Gm-Features: Ac12FXwOfyTS8C_-y9vSRPj-Ar_ANH_aFSj6ux_UPjsJxqIi195A9XgvWe9uzG0
Message-ID: <CAJ+vNU2JZCpRdJqUn5mki31oziTMvmpz=oBjGcJoWhDTcvTHMA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx6-gw: Replace license text comment with
 SPDX identifier
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 12:26=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.benc=
e@prolan.hu> wrote:
>
> Replace verbatim license text with a `SPDX-License-Identifier`.
>
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
>
> Cc: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> ---
> Fix up Device Tree files by replacing the license text in comment blocks
> by a `SPDX-License-Identifier`.
> ---
> Changes in v2:
> - Fix msg
> - Link to v1: https://lore.kernel.org/r/20250702-gw-dts-lic-v1-1-7aac2d00=
488f@prolan.hu

Hi Bence,

Thank you.

Acked-by: Tim Harvey <tharvey@gateworks.com>

Best Regards,

Tim
