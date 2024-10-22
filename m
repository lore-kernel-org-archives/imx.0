Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4C1A4F01
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618615; cv=none; b=Tj1WYPXfDNsO2V96Gk9YclAcBEUhLHF6jZs/K8X0+v0ZSiQpGF/VKB+WYDCq31QpWuVfj3XmmkBCpTnZtoX4x6S3ea/an8M5DHvYnpllL3G495oJ4lOnJGA2Hh+tA1/dmn8RgyUzMeMDwuj/GDC08FkS2hh4le3ERIAGW+twTnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618615; c=relaxed/simple;
	bh=A0rRwiZmVRMudCLJX+9pCJK3ES+/ITJWDtgwWJHsQME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUx5eG6vv/+2n4dgL2rO5quKbx2BQPgq5hF6zq3PFXhs3RnsV885lodwlAvEmzF6E6aNUGmXD4fUS3lG2dusuGbLY0ua4WROH3iVkVq2h0f9jNCSMFCW5WwCwQffKozKyp+68igmR8Ls/WPN8TkSnyNZRwZs5m1Il0/q7TFcKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+tLwSV2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+tLwSV2"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so6671736e87.2
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729618612; x=1730223412; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0rRwiZmVRMudCLJX+9pCJK3ES+/ITJWDtgwWJHsQME=;
        b=L+tLwSV2FAQu1TvuWzf7hLBANmqohHjTqn53NEzcD3eWWxZ7KZx92DB+SCHRShZ7HH
         4WbJ6m6qMY3L7DSNWVifwdlajhCuTr7+kJ5LF7OA+okqa5bPhBdI6GoJCiXJm8DG9qzT
         2Lt3KWAejOFB7iu6cDQlXINjUKdx7V6e7RgDCuiM3NA6nrU5aSpvFiY7OFDdFRQiMPc6
         lwJWIHDdqavBKmPN/lHAzBBc9mF+eVrhflXQVdmSHdTh94OnosKHlI/wJVXiAOOgui3t
         VI//jDPGDzzx8l3eTx1/Jo5245pyxrRg5ibsn+YaJ/2UsMgrgWNsTUbxRyW1/p1DBf2W
         I9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618612; x=1730223412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0rRwiZmVRMudCLJX+9pCJK3ES+/ITJWDtgwWJHsQME=;
        b=Jbhb1wup0qni6D7ztrOdCMbL3RMg1Es4R4Q5Rq90tJ1GVg5JSC7E6d4jfom93fOmnE
         RKpZCMtH7JQO/r6SCwhjA1/iKRJ1zlyXPp/KP9Cnnj3DwewgFxGIvHHXgFnZtJk7nKBu
         uQ/XxNlhxzfZm+M/l47F44mf6KdVihaxrD96bpO/iXxa5mXVG7KT733flO3qiak2Ns8T
         MrDbWoRiJkEJt0CJaWeWThJzJpszzIaZWmg1C+HwBctnen/FHjw2O0IVVTyPM+KMeSJT
         WKJUtL8yUhX09EtHUrz+l+DZz0hOVZXVCaWljGnFAW2Fqr+82eS5nAxXuw3m2RbYVTI/
         QZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRy/+9E9PWev09bRVsUtuZFhv5eLTrfW2x6wWy3mwif4cPKrPlZYJlHgqobAFNrYIBEMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5NKvIUkYlZ+zVc2ANJXm9JxUhIoMoCKz5cTi9yDCEflT4T8AJ
	yoXw28H4sZfLP7Y3kO9Nn89Fa1ADGoqZwbrJuEdQ+AhIijMwsMnxlyc0le71lvnsQv59zTJarlP
	JqwwasGNJCewJJktvsBbIlFes83X/MzoU
X-Google-Smtp-Source: AGHT+IHESL1pgIga/1DcaFprc680IQPO/MbgmFx2MwT8kkePvAJwX89NW38rjSyD8aBcw7tZ2hZZ8Om6l64XvUJHk88=
X-Received: by 2002:a05:6512:1304:b0:539:fa43:fc36 with SMTP id
 2adb3069b0e04-53a1520b1d2mr8509712e87.12.1729618611710; Tue, 22 Oct 2024
 10:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021100224.116129-1-lukma@denx.de>
In-Reply-To: <20241021100224.116129-1-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Oct 2024 14:36:40 -0300
Message-ID: <CAOMZO5DpJmWOExk4i6CWQ6XG_zyU=uz-ZCOBS1t9Xbk1YO2MVA@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: display: Add powertip,st7272 as DT
 Schema description
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Oct 21, 2024 at 7:02=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:
>
> This patch provides the DT Schema description of powertip,st7272 320 x
> 240 LCD display.

Using "This patch" is not recommended per submitting-patches.rst:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/submitting-patches.rst?h=3Dv6.12-rc4#n94

"Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour."

The same applies to patch 2/4.
