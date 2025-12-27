Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B11BEF8A
	for <imx@lists.linux.dev>; Sat, 27 Dec 2025 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858856; cv=none; b=JT9HM2UbG/cPc0t+Vo97c8ryd+Qqjrj59E5oI3rf50oJhZ3cHJo7b1bMvx0KMWQzJ7S4EUUtvyOBadAaIc4PsxWXJkkRoxOZYkzAJBknSdWTghCN7opD5XgG9nBbYidiw52dJjKO4kEPbH9Ba+VYRp3h0WZQ4wkRInI5b3sNfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858856; c=relaxed/simple;
	bh=Waazk7Chr4RkJhnZHpZEcccDmzXQvP+M+uK+a+IMu58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FY+3uB4Zt1q8sgF8tHVJi78/Qr/UqLxLsqGqQ4f8HLutv8EV0i3hpXrk+JlZQ1/LWmpPfKa3TPBv6FwBwafRvauyIAe8MpUHRClPdxnJRCuXSm/A3s4a4tIqgkj3FeCuA3SsBOPNW8SrPK6jKKgrvxDKKVslZSM8pDq6fqut0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti6vcQUA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti6vcQUA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957db5bdedso9246906e87.2
        for <imx@lists.linux.dev>; Sat, 27 Dec 2025 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858853; x=1767463653; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Waazk7Chr4RkJhnZHpZEcccDmzXQvP+M+uK+a+IMu58=;
        b=Ti6vcQUAjHk1yln9qdYMnCM1p8c1r1tTVdkeFvPfr2l+XlUjiIGoY1QgeZCTAdjWxw
         7ahxz54Nnj63vIn1JIu9wkr1R6W7ePIHGl4tUSjN/Ssf78uYpUdmKoyluZidqD0PhjxV
         0FFv140Qk/LVprpDblyyOD3/OSMV7BgTGXjffxDWDBXqKoRVrIePDH2c/J+4EP1F/2+4
         7kCad+/NGR/J1f9GAEWy65jMKLpLEvgmNYv3uR/Mk/2xf7mnLCXQoun8jHj+U1n6NsIq
         aMDo7aqRZhmIQwdau7kXzMkkRlnkkTRvZ9smoKZHAfmC0rGCLxBH5GP/MtCtVfwJ3pV/
         +WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858853; x=1767463653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Waazk7Chr4RkJhnZHpZEcccDmzXQvP+M+uK+a+IMu58=;
        b=Qc+JiK8kIJrj4gXHduP4JvYTB0UX7U/HLJykbKuyce/rVfk1twIIEABvCnAUZI2uMf
         /nWxyw81ZrOxj7vqNulO6eCCJbHAE77g97KadmjpSv/4WaKUEZRB4Q0qcsZHz1M32alo
         F1inyJCSj0VsCo7jvXknM3O5UKt9gZN5wIl8e21jEr2A0VzqTcqplgQGYAEq0+h8ruEv
         7K8Vhd8KY3vEK30wLDazFQbPj3eGMG4NYXWF7MQlbiVJ7CW9oPPJsYBN8TGa9izSHj6i
         +uxtxZIdhHoFgjPAKMB7RtSJIccvJJ4sSsER9E084E4fLHs3/WKwR7mjdtVRoJoJy6zg
         CkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZpY7cX8cmq6L8ZIdg6q/dhQbAb+uNWkQrtbtehVzfWoFVyhMaghPE3glNBH2PbZyJag=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOH0QNVPHhfRhIOqsRge1A+loSgEhm1bE0+UazLxX3wBA/hRtv
	MYAfBCYVhPezdCVjIwwCeMMbaAZe2MI39cCPHv6mS8V/hBog/7zSbTBSYmeKUSwSscsFh8880So
	5ptrurp1L/JB/3sTuYlCTPOyKPClovco=
X-Gm-Gg: AY/fxX5uJrnR2pGEyHCexcFUtZNsIbTiDvI6I8cuoA0a62jzW4f7oh7U5KCh7dowB/l
	zOxnYrhdb+2k1WWBbPAH5TbRRWIOWWOzzPtQ29IVL/hqJyu6XAmleNfZ3MvrtNtswfpUKzaPU2b
	NKTRuB+jb8WcVKopepYgSGV0lGu08GO5BxWOHvx/vIsjE+B+ojwOD85gkeqnQZII9C7ycsK53tw
	enJ2VxTlvvjc58jxYZm54IT6O5xL7IOxg1QNvxjJ94+2Nrc9+ymKbegTd3vTlrhUwuFvSkcBzsx
	ktAZFrBP
X-Google-Smtp-Source: AGHT+IFCWi+xcOloUMoROGoIzYaFAUJZIdqTotKSlbJ0z4kD2aXq3+J175FyLSw03roG3BWHfLUepv8zQ3y6JDq+uvo=
X-Received: by 2002:a05:6512:23a7:b0:598:ef18:accd with SMTP id
 2adb3069b0e04-59a17d366afmr8212530e87.22.1766858852671; Sat, 27 Dec 2025
 10:07:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251227-armv45defconfig-fix-v1-1-d7b64abda9fe@solid-run.com>
In-Reply-To: <20251227-armv45defconfig-fix-v1-1-d7b64abda9fe@solid-run.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 27 Dec 2025 15:07:21 -0300
X-Gm-Features: AQt7F2pBf0S97cd38koSQNUJhPS0_8sYhzk2OunlAUme4hgTnsZt7aAHQIzKjyk
Message-ID: <CAOMZO5C=TcDSQE6Snuzs4Ry-2qP36qDZmoDCL7qJ+UHDUgkVYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
To: Josua Mayer <josua@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 10:24=E2=80=AFAM Josua Mayer <josua@solid-run.com> =
wrote:
>
> The i.MX5/6 defconfig has gone out of sync with some dead options, some
> removed and some missing.

You mention "i.MX5/6 defconfig" here, but this patch touches
imx_v4_v5_defconfig.

i.MX5/6 is covered by imx_v6_v7_defconfig.
