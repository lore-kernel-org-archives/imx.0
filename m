Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A627735
	for <imx@lists.linux.dev>; Sun, 21 Jul 2024 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721562061; cv=none; b=flvgHJm3fVieYD2CBfVrboeifZzxNXypq2SkQnjOrZeicHCXxZdeZV1+sxR5PtZdIwYrZ96ptNr9rzz8xRlunT4+9HkfPwEDhOG6sglZCVOoaCZIRnfXuHNjaeJaWHpGRdi5KaHBeM538tOYxIdWz2aqWN8jMeW876enqirDwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721562061; c=relaxed/simple;
	bh=Q+EyK5KSVXoDYojQseP6uaAw9ms6O/Cd9wFUQCgWJuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LorEiQ/j94cWAAc3LyNiSoYZKcoN5w3M3jidL1mTzJtWbakpYZNFnvIwlIG0Arq+oONJpDh8ww7P0JantxpxxRHPSV12h7JXb+BxZ38ITLUx0DP9V+iSASRkbPDCPP2/QeAdCcG9juOj86FQSca4Ffr8oQl3lt4OI5UQ+NRJp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iukgihqp; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iukgihqp"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-260e3e295a7so1948614fac.3
        for <imx@lists.linux.dev>; Sun, 21 Jul 2024 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721562059; x=1722166859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+EyK5KSVXoDYojQseP6uaAw9ms6O/Cd9wFUQCgWJuA=;
        b=iukgihqpwsTWOe62624Pu8QYRY00yw8vRcayQ+3d/P13qvbuFKQZVINiZViPo6eTD4
         /nS/9ViMIaOb3vdrQEnUaZ3TA4WOd+HxQKxpI3E3DYIojUXBrqQp7LHXgUlhe6ZJVmF8
         ehu0ZLi3hFV+jRSbiNYjo6pUUcooxqHRsohFetIg4vqWx0hQW8JDi69Dmtxh478oznts
         ayPopQnuNn4odIKM3/IwlL71f/4+55Kp4OEgALWXrXog7wMuoUfqh1KrcqsQUk7S+jEM
         9MVQLr3Zg3WA7p7EcIIiXSr1vy5Vz59VvdKO/lyIeECw0XSFhhrEra7NhNA+zLK37K3w
         J2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721562059; x=1722166859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+EyK5KSVXoDYojQseP6uaAw9ms6O/Cd9wFUQCgWJuA=;
        b=LecpTJCb/5J3WytDc2k2kusWa3tom/Uv9biHY0KrwsDvFBUZHeul3ivfXld3u/LAbk
         q0o50WzYdwp30giEDIpFWNcpYEVorOl2dPu+UiOSECrTymmKWnO94aWSVm6/UUN8alVv
         tUo7+Qcd6iee6+MXCg+cpY+XGItskOkzru9QaYRipXSYCmT6UskxHZfvQGlGj359UTjW
         5t1JcR9kHLAjCSlKcx5NaHJAIJTTILf9gJLIBrKKqBbj/jRyL7Iwt/lwX8csah2LuXQq
         stCHp/OUVzf+lO7DeICMKICqF+MdEwpg/a4JAZ3YfSXEhj+Kb3ZukeFoRgldCnAXXJld
         78qw==
X-Forwarded-Encrypted: i=1; AJvYcCWECpYEsP4hvSN9lyBnBpvd30zHBbGc/u9QUqQHBeBNmFI46uAWpq8Yi1VPZhX2x9X/zxwdDHs85PI0qhfOBVAlz+ht
X-Gm-Message-State: AOJu0YwFJGQVC8JEMrLrptwL4r6/qgQGgN9aY9ahER4bMrAR7gQqXsVg
	3R3gxlhFEy3g3ghvV1GC8KfEZokqrrc5X1XvpOYXoNgFhHNfAWnzyRk93QqeY+B1xuoOin9fho4
	k6nI/Wr2eT67rYL5vPEvzJkKJkOI=
X-Google-Smtp-Source: AGHT+IHTBah8cNq3NdWznUVOIfFXR+nEtBvDOnHrlzv0ICb1QiXJ2G+KHa+o03Qbt8HTjzossc9zMGclNbnKTjzzTMw=
X-Received: by 2002:a05:6870:970f:b0:261:1600:b1eb with SMTP id
 586e51a60fabf-261214eac1emr4705877fac.31.1721562058704; Sun, 21 Jul 2024
 04:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240720100848.203546-1-animeshagarwal28@gmail.com> <ac09aec1-0c42-4f8a-b4cb-64eb67018d15@kernel.org>
In-Reply-To: <ac09aec1-0c42-4f8a-b4cb-64eb67018d15@kernel.org>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Sun, 21 Jul 2024 17:10:47 +0530
Message-ID: <CAE3Oz81jhzAiwJXPiE4rQjD8TzBghugvA9sWV+Tb_kz9CdQyiQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,imx-audio-es8328: Convert to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2024 at 3:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> That's not a DAI but audio card / complex. Drop.

A reference to sound-card-common.yaml is required instead, if I'm not wrong=
?
