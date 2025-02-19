Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18801C6FE3
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968817; cv=none; b=QZ79ssNr4YTR4RfE36KdpI/o0GP81efwzlZ5RaUE8I5G6bVlZG7eu4KdGvStgYYTc9Qgyjj57zrUe95QOchAiCK4DjTkjhBiDOA5MGd9K162aDS4/F1wzsKUK3pAJ0BnhgDqQ6uyVqyrxcg9Hr49TBrIEiehLkSUorNd4sle4kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968817; c=relaxed/simple;
	bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaP57/IliojWm0Bj+eN/OoaR7sWlYAmF1pdu4N4VbPZPTFvHosxpk8781tOs+MljlOp8Vm5YJn+ZtLoXm/Wh1vKu2YyWgXUGxx6bSupvhgs9bBsGhmvFREjiZHa0tjhofGN0/cbfQDH0MLTrkKzbZJuUlF20sXh1PsWiKh/u6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IN6YKBA7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IN6YKBA7"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30737db1aa9so62862221fa.1
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968814; x=1740573614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
        b=IN6YKBA7YKbFSdVSFpY30sZtDqSfVg9mvKpOePcJ1+UQbHrCfUtS2/oRqwBTUD5MCw
         HzebihlN8skykTKYqeficn6pYvyBSLUjztd5mZEOVGUwC7BCH5lm3JETk0IKbEnFxm87
         Pbq6DAXZ3K6SPcDmna4Rmp6dfqhGOVDvPsFbiGMJ0Gri1t7rxDVpa0vBtH2Nc5wPb9sc
         TXriCZUYQ+PoP71TwBGIN4ve8yI//pRkTHvmH1IQ5vnRl7sFmNSpvjCOPrTwxM4v3kg5
         C9Ysi3fGz8FbMxH88DeUQf3ZQBvYLyTxesPT3Uc/4zrfhc2D0T5IvlzfU56R1jRZjzqU
         eCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968814; x=1740573614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
        b=IkYQeSQXlagPfI61JvjNyLbtut3sSIdG7zY8UdlI9/xq6MmiCTMb9yAvZ6O9yrFEHp
         Sjh3cnuuAFQDfxMRT3+pNvvzsQ+p3hgGFzPxAEmM9OLh2yFcDtP8J846zTpg+TdzMiXj
         tJQdd8ph3K8L+Rn0+CxLLrOf2inCMd5WxgVFLojVbeUDip3qm4O2tKfmZPFBkH5mKtBL
         jxTMB3WM/v3YG8H49M0hNgikDDEwH+fbeA8/jWIQUaPIcWLszJurKJHFkRBadfD/ZWZ5
         G6sRFyC53zf6flI7i7FEnsXZx1lnps4LUi2OMZWaNSgxwhN0mvxZ6NfcAYkUwmE3FPVJ
         y9GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcp2EVkZh9niaTarz6aGmf51bDwidtZN3viBBFQKACLxmPFYO6nU0GHtDtrIvFNsp4Ilo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZP2VezeZCPnRRUDL3bxgL6/uwkn7Xe7X6ctHk73bS2ycVf6qZ
	FFJ+FSSmid/YYvH1MiaCFSGfSVBn6FrYXlxUmx3XRG7b5QB8u/yRXpQpbcsQ0xXZ7I/GdxCoDeJ
	/JNwWMbc8Et4JdOjZdzFl2Ey5M/WCog==
X-Gm-Gg: ASbGnct1k4d5SG9ZdSGxyiCp9Kp1CToIUxKXODx15z1Hs9Uk9ss+cANKYCDlt5zqXDv
	eZcaWZpLwXH8c7pKMUSN8uO2f3wE9PqKK+IKuo2tlvJ53zEJmZsBj1+FGJWKhx52vy20913a35F
	dyLv9KRYol8BN/H2/p/arfloT+ZTY=
X-Google-Smtp-Source: AGHT+IFiEAAmOQeNiwKM9pYHoGOeRxDwt6aWpRp0aHFkiqJ/scb58wtITAVUYzMW7vzAfCPPDIj0kMB/lDvHjfDXQ/E=
X-Received: by 2002:a2e:8810:0:b0:308:e8d3:756d with SMTP id
 38308e7fff4ca-30a44ed1da9mr12054681fa.19.1739968813787; Wed, 19 Feb 2025
 04:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101135406.47836-1-festevam@gmail.com> <173073495749.210192.9138587910771237679.robh@kernel.org>
 <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
In-Reply-To: <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 09:40:01 -0300
X-Gm-Features: AWEUYZkvUCi3PRNaZjpqQ7zkYqcKxcjgv_RBbFS6LFh_ywtWOQiG9QgEhk9Prp0
Message-ID: <CAOMZO5BJy2B0Jy-ehz44ZkrzUpGqrAs_GjE-Nh1P9K8uDXVmyw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	krzk+dt@kernel.org, a.fatoum@pengutronix.de, dri-devel@lists.freedesktop.org, 
	andreas@kemnade.info, marex@denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob,

On Tue, Dec 17, 2024 at 10:20=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:

> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> Can you apply 1/3 and 2/3?

Gentle ping.
