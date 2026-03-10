Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7038B156
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148498; cv=pass; b=mZmvWc4q+IipQNZx09l1y7wmZQyuwB92LY0Njllt2OtasJ57lWwFe5CUgY+3PCKfzP2jriWosTr8VyTfBo/t/QJKAFtAkjY8p6oIPnjyDqrSm62UhomxCQGJYsip2l3mKM1lhsDcjb9qQxRUUQGKttWQcqOy+vyFoF0LK3zKYuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148498; c=relaxed/simple;
	bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0yUXhvH54ALZuogcbQlf8ozEYPZsyTl8nMiO+T2fOgCy00yE14AmeN9e5UKdyrcNqtTlODTGkJlOjVzNb22BMsU6/yL/wxxY3S8Drest2NQqxRoCKzEFsZIK1OjMpbCKD5kp6S5ST4w/Tcfj8a3JRSNomZ9YJpDxOjByXAWFCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f79sfZAw; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f79sfZAw"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e4989dacdso7364685e87.1
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 06:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773148495; cv=none;
        d=google.com; s=arc-20240605;
        b=iPTrrX4/qQSRhS7PsOck8r91oixL3qw6VieRjX0COc7mb7y8fjGaoE8s4GAMk2FOrr
         5pZB6uzWp8P1rtat6XpZbgdRuvnfdobRnCR0Cn98ljYfgAjJSfkq4jJzmoNTfvQ+J8iS
         IB4xb35aWjwywbZVGElqjvQLKZ9Ymna1szbWcuZ+dq1+SMvC0fVX7hnE8FQW+fi5vOjx
         ppLiXgqud2G7nX80dxNuWP+ZZgLcvNCWflXLpdWiFcjeY5Yf3uh4/Y5MfRmsSJK0+yxj
         At2V/F4917bQ35lvmvCopdkjsDOdCDnmJDBrxX63jBQffFwJ+Yo6bja7F8gDo/TvMSLJ
         GSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
        fh=k9oJ2yhpNYsLbJ+lFSygSeS4oGDWyCPuOnqegduIuQU=;
        b=OEr61aNPDZCD2mEfVe1hpNvtWVTx8Wan7yIArWx5pg9EuDLi8JBDUcHi6yK8G3umVx
         4wxC1bhtmHCnkfLR7wScF2yD2S/KKkFq4VUXkVLbDqvt9ijNB7Q+PUHfkiibbzsHrUjh
         LzxQsBYkq3oyx32ET86iIp7dBxpyzpwvjW/rqePW6jVGlVSt0Tw+lBbVCyk+LV+dm/1e
         ce31TZXH8o6usOU+N5dplBE1C21TxyqtL2Pd+vtpENgywNIfdJB798dX8K9W3WYWizNO
         FSw0Vq7AVjGXpUfvaz2wvsXnPLe0SgypSD93tA+BQ0+u9IMnuv26Hk4dAUGJj1skBVh0
         MnlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773148495; x=1773753295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
        b=f79sfZAw5RLw1nCReFTExGQ+b3PMW1rWoLix5kWkqyOhYfA1KkBJzY14Dav5GKUDyK
         q8aR4D1maz1T3xYyPQTxK/e1q4xq4NkuG8S7h7+iyQ+o5dlB8QbcKpQyGV0F/ELF0Gbi
         yn6WKknGXOt/0M/FDZ5Ifga+nzM6ucws4b5JmCmhYH21idJz55yr2uZUzfRikXEE3+5n
         OT02uaCgH08qIT0hya5vkU/cZvY2qSMMEHpkeKrNI98ItFk2y/XcLEfI8V+7Bc4EOs4H
         flhSzMzaWV326errOBpjXrwVv7zOhcBCbdU5C9rzFv0GmFx1tVmOC8Tn2Fw8of5xP0Cq
         vuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148495; x=1773753295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
        b=SjmEW1YsNsQ2vHAdDwXbnnBFmJI/J13cbbuWL91/WWUOyXZ1ylkwJRSAdK0AJXr0vM
         XCaPpV3D/qEbmPIzibWQLn2Eny5W6/BU6vEAmZsevZ8n90Zr/Js+01c5VE9AErViCjhi
         uhWxqOQEiWy4cOmMnbMqkz+AVdwMUnLdvp9+ZwFLMzTN9dcakWYRAbEw2r5coxCLWroj
         pKphYJvNVk/3LfK+2LRugJddpQ2Lvdu1Fy8fL9k77990x4CKnTlVxofbigujSSqDBYQX
         PpKh/RADbDHJbT1zYwzEnRULQIvH2R5KKo0ZEu/ZoNORmqd3MVvQv3y3YmGWXYWWMfJF
         XWKw==
X-Forwarded-Encrypted: i=1; AJvYcCUgOP7m8wf91iLHDN4tZ1TTGww1ZHy6G7yB2OBoq2P3hsQF1MXTY2BNf1V+yyncyRKFvik=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNp+BoRQ+GLWue3Yj1wXVTKRjgNQyeTbu/Lot/mTlWO6KchZH0
	3L0TtiD9W3DWslVzuJ32WZTkR4fg3oBIjJWKRgxoSC5WHF0a9Hm8r8aFHcs3l3txroqD9mP9j19
	qGGHyU+UwJDU6W7vBTZuv8xs5cYHjJGA=
X-Gm-Gg: ATEYQzwR3/o2oW69HQlTv+32ZOkgdSxeVocoEl/OMikl4I2Qi6BfrxPgaRl37zQ/NhE
	Kz0ZYCv6XtPei6/nMLCrsTmkhQGWS8HXXy4dziotxFO9ImoH4/vfVvNS02K4AaiKeF3M5M8oC4Z
	GY/9L7I3GE4BBExE9FnvEcx3xKyGwBwlsZtDiow+v6Snmcy5StnybCHakEjNrbi9opOlS4YkNoC
	NyA42LcYZH5EfLboif5sQs8wazM7wMI0EC0WX9JbheTT2+mdQ02BaQQoykPRDPuplamXYn3tAmR
	rFPibP1+xUBzDqZQcUZEVnjXNP3xUAIUGrEXIC97w7PU83sjmwfuDgzNFFtjHQrQWkJSrsc=
X-Received: by 2002:a05:6512:3ba8:b0:5a1:43cc:9f97 with SMTP id
 2adb3069b0e04-5a143cca133mr3775932e87.48.1773148495109; Tue, 10 Mar 2026
 06:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
In-Reply-To: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 10:14:43 -0300
X-Gm-Features: AaiRm52E00LdH2rZwxuFYXGjz-kZKy_GcD7ZYQ2nDQ3vRAIkTC8eVlnQwrS5urM
Message-ID: <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
To: Andrei Botila <andrei.botila@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 9:50=E2=80=AFAM Andrei Botila <andrei.botila@oss.nx=
p.com> wrote:
>
> S32G RTC is probed after the RTC on RDB (PCA85073A) so the S32G RTC
> ends up on /dev/rtc1. This causes the suspend/resume or hwclock to use
> the wrong RTC since it takes by default rtc0.
> Force the S32G RTC to be assigned rtc0.

We usually prefer to use the I2C RTC as rtc0 because it is battery-backed.

What's the exact problem with using the I2C RTC as rtc0?

Is the S32G RTC battery-backed?
