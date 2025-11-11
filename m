Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E73148CD
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861855; cv=none; b=EmFe0JidHo/bdYc2dJfasFtvuounoKMXoCCJ4dkjMOjGgKmnShcQ86nV1mr1amiTZQ7O79WQei1d4eNah0pJaH3sU2H4mnpUjY7F3Cz09j+e0fxroq80NY5MXP8VO2uNzurH7DzbG8vH60Cg5WrwKWdiE3+0p36EE+K8F2FGIq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861855; c=relaxed/simple;
	bh=+XIJiU4GwN4u7iXICtBpRcSFrGSAAupuGFVPE5WJPKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paKPp0vU8t/Cjqhqv+x/RVn+iBD6Ew9EQgoo4IuOzh5IrntPL0O55K7t5WeB1465Fmlp95sd9qij1pdNDtDi7KWj9PVf/p33Ui6FNxrM5D5+NPT6HCfREYu7BPSPtijpk99HzfZIBnehPhwJ72DiThl8NtsEukqDq4a1gVyqXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+SO2SdK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+SO2SdK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943b62c47dso3685145e87.1
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 03:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762861851; x=1763466651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv5b/xw8gYFcuSk4kaCj42BkeJNohwR9re6S4f8Ipq0=;
        b=E+SO2SdKkCp/J1akiLDqbXVSOaGXAHdLCDMJNpgcoi3yTFUHsMg6+6AnC9zQRiTGwV
         fRl7iaPR8cJVlQ9+c1ZbElZvR1TmXiIEqJpmLmnLAMCg+xLjEm5tPivn7yUP1m2DxygU
         Ab/AE6dDgUe1kmDppZ0KtTGaAuz2/4Y/obMC6DBfu2s4mImvVQAx3rv6boc4hFRT94aY
         2i2GGmsQRMwnUoBXxWubjsT5uoGEYwAfOBYh7OQyxqEqsZvQQ6iOFWflM6scCpw2kVXD
         lMW8AX5dFT8dHNoFjTo8KmBkROyATZ93vtrGMu2+3FyJJkOkWsCHC1WfKA3Z2HdCBhoE
         e5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861851; x=1763466651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mv5b/xw8gYFcuSk4kaCj42BkeJNohwR9re6S4f8Ipq0=;
        b=hz5Y7pAMWdaKwhQ21nMGsRNIUcOPOqFGMqSPG/OHQOMmK1ndmmVvJfiCt4KwwR0oQi
         XI/oTxw9bLllOgHCQ2RBSGXUzNlg6Wozhk9hgJ4Bk+cqxU7nG3hVDMiI0vsiNO1l4QuM
         hyByqXgik0j0hVgpWKz8s374EKOewQL33JQkztDcXK6DJBT6hi/fqZMkL/t4iE6YIrKq
         36iA3wBV2qrhoonYMK/J31G2pETMwwTc+svFSsz3g21PuuBHrdJYKyB+gLOwqvOpm6iK
         hTP+HMgtgZjZ1o98bDQvI1efUw0mhoiBgCVtRW+e7+SjCEuV4yNUoAwfKE8X+etZjRcw
         SQRA==
X-Forwarded-Encrypted: i=1; AJvYcCXwnb/dGDGb9ikh+4wysW7cB00t2NaAurDvjQcymyvg5geEDxkKY729Nze3TmVKQtbAnCA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx9TaJ3nhT78BgaE5KXotdjeBAlYwUC3Ph9dK3QpbCBQU3GfFY
	B8HQHIhrqjVKrxdmDrchY/E7gR7iXyngl/yAP3DtDlkCpxNCbBxUHM0sZo1NRbDeLHyhYGN8+5K
	RSmoDdzjlhjZkWh6zgSoMPZOF2JYxkxk=
X-Gm-Gg: ASbGncuO6Jf/80bD/4+0apY8m66lPDtJo0v1ZNSuyn85AK/Vwa4dS4X765CNudpfHgw
	434xGcZBy08dGdXhg+7K/bY7rFRHU3HLhvQ7cdwftaxqnjoDhhhYv4dxyXoSl5N7VPLhQGlVGNz
	MviTlkGSfDiShdYnp4xfsHcqIpwxIgdj3mRN0fTEVaQ4rvGfw/UWTTwl7r5bNmbBUkogKnCxvW4
	LOcMFkxEoQW+Zn1Zu4CB4ggAR5d5HbqoyAfR6rXmVF/TYmXVCbbxdqoLW/qKJybRn3X6VbxSCIs
	0sI/crN7kW/79Yvd
X-Google-Smtp-Source: AGHT+IF88z5at8UsnN1rJmg2IhGaaNFuSng3Rlf9evtFG8rtfKiEGAp8AmRAUYBfUbuGiUayIKhWFzPcbtLj8c4U6/A=
X-Received: by 2002:a05:6512:3b06:b0:594:4e03:2be2 with SMTP id
 2adb3069b0e04-5945f19c023mr3782490e87.14.1762861851172; Tue, 11 Nov 2025
 03:50:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
In-Reply-To: <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 11 Nov 2025 08:50:39 -0300
X-Gm-Features: AWmQ_blgZMv3waf3DojzBGgJUKYe7alAx5RXa_SxBDQp7LxHHOXCa8N82h9a1G8
Message-ID: <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:

> In addition to that, Rogerio please read:
>
> https://docs.kernel.org/process/submitting-patches.html
>
> At this moment I think you should keep the original author of the
> patch.

Right, but NXP makes a total mess with authorship.

Please see this version from February that states the original author
as Xiaofeng Wei <xiaofeng.wei@nxp.com>:

https://github.com/nxp-imx-support/meta-imx-frdm/blob/lf-6.6.36-2.1.0/meta-=
imx-bsp/recipes-kernel/linux/linux-imx/0023-arm64-dts-Add-i.MX8MP-FRDM-boar=
d-support.patch

Then this one from July states the original author as Joseph Guo
<qijian.guo@nxp.com> and it also has:

Signed-off-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

https://github.com/nxp-imx/linux-imx/commit/fd8010b46bb00344fa519c73b643fad=
71da5887b

How are we supposed to know the correct authorship tags from the NXP
commit, then?

> Then mark your contribution as follows. If you just picked the patches
> tested them and made minor modifictions only add your S-o-b
>
> e.g
>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
>
> If you made significant changes add your C-d-b like this:
>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Co-developed-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

Rogerio's changes are significant as the dt-schema passes now.

The NXP commit has all the dt-schema warnings found in downstream BSPs.

For example, it makes the old mistake of describing:

 spidev1: spi@0 {
   reg =3D <0>;
    compatible =3D "lwn,bk4";
    spi-max-frequency =3D <1000000>;
 };

Which is totally wrong.
