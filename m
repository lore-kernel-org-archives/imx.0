Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2173C73FD
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420765; cv=pass; b=sDfUzfSXWoa9+M206GoZgs8qz69FejGBQGDACaqIMryJu49TuprQCJlXBPxOVmpLMySeaxmlPB1HfReXjyUCbONr7CBvshu/GtflWgYcz7Or+NBzjaEhYqBom/Egm5sJeJX8o378yHereDoSeRX8ZKH6qUWBzKc0hNf+K1md4VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420765; c=relaxed/simple;
	bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYBEp6TsHrugkO1GwAovfjr2NPolOEkG3hyPV6ehNCmaSKxbMLAi06YiM42+jXp229KR8Xh6dUbjb9/4XFdUo9Pkc0BStgZlhkcqXWVi6u9eU4wwNZfLjLG6Pe9hoZ2Ft8MtJR2ODx+ou7Q109Mum96Q54FglzjGtijtyUeh0kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFZ2qA+e; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFZ2qA+e"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a45bc61e9so18928501fa.0
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 09:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773420762; cv=none;
        d=google.com; s=arc-20240605;
        b=J2DMpmzPPC8GpXTuD++A0kltGyT/NmDfjADoLjUaTNc+u7ARRPwLL0LbyTRIgodvHK
         Wxw5aQfN0rFdxkwkLVIVmUx3CResF1xxyyODM7kt1izQp5b9buw7dA6mAbnZ2NJuEhVl
         AQNCkTk1lcO/zjyd8RK9IyZI5WTgy9fcZ2YpjBOwd6b6hnxGMWNit9HnBrz5zm5du9os
         PkeWak8/gOAs2dEabA+m7AV6jNC+agkl4xLh6+BBEsntjCMy8v3HvPxdLsLcIEa1BRUu
         hVba2zV/12uW6cCkTn3m/TU9jI8h9+4Z4nZS4P/sn8OEXmbs6USbmTF69cIL0ycp8Hy8
         jYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
        fh=+D44F0i1OKyslHItO2i5hXUDQkLl0zeOdzrEqr2NL5g=;
        b=j+PJsI3DOlGjWOckYmlmsg3OQ1mroO1tnMArtMTImAmu5uUdQWhHJDZfRpWy8TlEz/
         xjRY8T+PsjFEiiVe/sAL71r08qJjl+U6Xd+r1SpSCOxoCMgttm/rk9iVHJt5zW7RCQDu
         EPr1tM/NGrdBmj4PjUFD0lPwgrzyXgTGRfzei28dJavkdr30ADhRjyB9wmtpKwTaVpV6
         DJqX9udOVv7GBwkXpK2K1Cuo+EFHWPXGNDFaYKG+Sw5SyX7Sf6LYJ+ilvOktllVuLOJZ
         Z/qRM4LNulWD+bguOm2VtgN/aR9wFQqMywraRz00oG22gmCKDUPaX7JwIg50ruATHB4w
         +Sow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420762; x=1774025562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
        b=DFZ2qA+ecTQT30FMeE44bw1tSFdimURKsM0kDsAaL5i7Qnnbbo4KZxgkm1O67a4j6i
         NG2M3USVyYRAdP2aulkckQoDqXbP2KDwB5g+TZllcAFBZswLPMvrdZFqBYjlqnfnENWu
         U80BvoW3By5GiK+vj4baGzSCQbGkxKK9ll2ZjPHLavGXQvN150F+9xShZns0Wknx1o+W
         7ZeyHkom48T51u4NWTEiKilGuucXbfgf+kzDps6QJHiAaLrUQGzq484YQXA/xQ1yJcvo
         wfE3wtI/TDW1AXDyp15kGw1BrL/IWw6AULFvHijN2P/OvmKEwRpu92QMo7wGQHhKWtku
         DVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420762; x=1774025562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
        b=dIaLuk4DSAgk9ZGpvkPENKUiXzUYo1Gl16WyR8zSaMFbFAiMXfEnFkmrT/7mDPFWX/
         VRj/pepcltkdzMFAlk4EkZCFfAQlrE/kMTqVTVnVhlB01MKaCvffmy/DnKedurtx/A6b
         lEYDAKKYWgRS7fF6WcyJqhybC8LM3VKXBvLtO9JU0HtiUEoTjPs9DP8Y3N7eKPynQiLB
         1gZeK1zhYjchMqqC2m4ILY1OrItZ/FlmM+ZlNcL1YOhyY22Xoe7ySBQhy1iJ5hq8ki4D
         RtGg03BSKm4qaFOBzhuxlgYoDnHTzuqyIWA3C8fHark4FWPCee4dYCJ5SRCz/GuncHmn
         1s2w==
X-Forwarded-Encrypted: i=1; AJvYcCVnrRDUWE8gnIyKguGKJFyUKYx/jjO2STseTZ6TnXOQC79o+8o7qcDlFiTt8L1aC0AQxWE=@lists.linux.dev
X-Gm-Message-State: AOJu0YznGj2wbDwMdo40otQW1071tvjEari+n8nqQ9JdyalX8qwlmnm+
	coXQyTu9QLCLEUt2fAqWPotmduJzfFy/j2Y/yApQ3nQmoGEEuesj3ex0SuVCaEJ6g1DWnBXbN84
	1HDB6iVcnNzbmQYnYhPRGaBCbOQRy1Kw=
X-Gm-Gg: ATEYQzwD36xXoElG+dogOTfSnMttAmu+B4l+mmQeafOrf0I1m3vT8eHO5hA5Eq28hEP
	iCoJLPhj+St6j5coYXmEgWmzF97sQQyddV5jwqfYMZQ/XwTFxbMZmxGREA8U8TBgSA3OrlSxl9u
	gpITN5xaZ2xaRKLPc70L/A+03GusieYMf6evOxHP7/xm5JIa3O8lIRCZSpM205/Ue5jd0d+VWs2
	CwpsWZfRCSouvqNryxfiHmR18RdkLl43y8WCwEGjMcjHNUexmU9u9CJCyINCxksX3Art8/CWt4Q
	4pgTVu9nJDu7pXujPWbUnPzm9vNHPdh+MuRiJevc+HiH17UrA0o2KOKhVpEgF2X3NsZdEFWW
X-Received: by 2002:a05:651c:2102:b0:38a:4e44:7a14 with SMTP id
 38308e7fff4ca-38a89824096mr11615721fa.35.1773420761766; Fri, 13 Mar 2026
 09:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com> <abQ_d9fGarNobYdo@Lord-Beerus.station>
In-Reply-To: <abQ_d9fGarNobYdo@Lord-Beerus.station>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Mar 2026 13:52:31 -0300
X-Gm-Features: AaiRm52CBpU6R9UhBbKbW5aUQPcGYYXwouM18lgYHobd5ENQYOomz0enfBALELw
Message-ID: <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 1:46=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> Correct. It is not included anywhere at the moment.
> The Symphony evaluation board uses the IW61x configuration.
> The imx8mm-var-som-wifi-brcm-legacy.dtsi file is kept as a separate inclu=
de
> so that carrier boards using the legacy Broadcom-based SOM revision can
> include it if needed.

Then imx8mm-var-som-wifi-brcm-legacy.dtsi is dead code. Nothing includes it=
.

I don't think we want a dead dts in the tree.

IW612 has not been upstreamed, right?

People using the Broadcom Wi-Fi on the old board may still want to
continue using it.

Please don't break it.
