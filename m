Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53703BED08
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158611; cv=pass; b=VMbTmqzTeifVYEC/1Pw/alfu3/p55V5Itq4ZCAELYhQ4ycAGD2qhAK0xzBQOZbU6odcqyAmyY+TivfOXP3/QviCQ/5CRWPvPhoS9jAs9MQ12WBOh5H4vhEZOFoZ98hmb+9GbUVX7tWDKlTcBxfrBCCjXzMQOEAPpM9yNImBVbMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158611; c=relaxed/simple;
	bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQsTT079U5IZw3c0o1h5Xo7uY2ZlcQZ0ypZ1emfISEL4RU5K4Z+HEmbAsb+s+jKnpS8gK5gIaQmMOuneoTidS1T9dXD6f/tJj/gnqj8VZw08rPYhJu+PqXVSJyZz8aktIBPZMk9AYzxL8lomEapKfbIL3TL1ZsGF4dCxG1RF1bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7yIkI5f; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7yIkI5f"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso6165733e87.3
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 09:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158608; cv=none;
        d=google.com; s=arc-20240605;
        b=gtdLPaJvwkLO4VoFHSxh7a28YYah77M2N7Z8CWqfIbr6HC57Djc2O/aODrJtYLgMnh
         osp0x0ma9fciZ2MgaXOOqTfNK5ghIVU8Zlbq9CFB+AOPkn29F1ZcMAHdpNWiwQigsOzS
         1tifyOcZ3QFGSeEB5C0CPHMWr+rSzj53F8dcDvHx5b1jNi8cfPsaWyaf978PCog06GP8
         wEQDJCv3qgbPHrKFQCO+ehQY8fuStLlvQjDDCq0eV9l1ncYUbH0mbXSLpxAg7Is8ymEC
         EiCS3b7/Txpf0XuHYDsICjniI535WqpGrDdbi1JBILIGXvya3TXdfvLzsogQEukjrYN5
         YR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
        fh=yWoDB8KH5txw76G9p7rFQUNEKGQtF8TMnsH6fW4nKZE=;
        b=JhvjXEM2GD90g9DUlUUl+++K+SMGG4H+Sm+oHkRHKtUBCMTovwAHolh36Z5B8AKcrl
         nb5/V2l2xcWqz+66P2bMs80neY1+GfH35cEZKAKkCR1AHxrOymcgGWXTOV8FANt+zmq1
         GdK1ghEk45uRdkz70lTxVPK+2YrJVHbdAGM5Xrom5yd6AQNO0n9rSL7QPuT7m4CzN+YR
         4pqrPUwPCVlAwikzY8HR+1SvRI0BGjIQa1g1iOhIg6uG2OqgHu4lzTBVYA8ClzvaS5kK
         APMAuTc58RbKJM6xUetwnhsfAOTS6G+jMdV3ZJFlqMI7a7OG1EVeUMzzkqcBbUOuMffD
         LlCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773158608; x=1773763408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
        b=j7yIkI5fkxoai/S7nvpKCQtRnp70XhCtv5S1qJ/nMaO2TNOJG/JJkn2wBk526/u4Al
         2zzwWH60Uk2qKeEU9I9RC8qtd3RmjB1JGSE0vmeKv4oHaEWpjbsF3nBo9e6aobDMuQHk
         hb54UIRSMQaQ+1ecie7Y0fXi7wSYXlxD3ISsX7nBWXc+TS2t1lWkBvQ2SBUGM22dU3hZ
         eYCNxw/DYrCSbOW7nIqFg5yeaVETz4qugcSXtcm/Q6/tZw00fa2NSL2qeT6xvTZbzYpo
         mVmNup82+utlqDwSzbhzq43c8X13YFR+i+JGp0RqdebDcLrCspdSRiCV1c8L8ussoqf/
         bgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158608; x=1773763408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
        b=J0Me9pKfc2MoXC2/t0oIg023AV0STNoM3qwYnF4D//qwos4rp1ysCWNIIvSM3Uf3eb
         Sq6BHZHVzCovBD8+MPr8WcWPVYgXjs3ya93D69o5ssLzZyHAKGLSZCt/h5K0x7K70Hm2
         r1DzF7agQgQSiGWE1cp/f27kEYMRog11kX5nubalIITlXLWJX46L3wA1PBSqKLhnv3Ew
         WMgMc17Mstcw8Ui90dpw9qnMUApJEVBxffOoM3Tdk5yOEZPHiMHQ50LM9B2SPJkTz/R8
         l7COQHb9j5PQw/+SE0aYyO+MwBgfbN+r7YI8bjhW1vriyDULpNHzhQssKdhVM/jYiTxe
         Ueag==
X-Forwarded-Encrypted: i=1; AJvYcCWfTKLe08HnTLEdG6aKJ7LIuXYIrPOxiRMRvYSfsClWWePNCW6zKZ51j2C8ZgqX9FIk+4A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjxSgkXCSX/PBPxY3yH+f8sCLZgBUtVz2PIObfHRLBk5a7tbEM
	pH7ar8H/y1a0wCv9GWVfztd/cBDAVV4z6t2bL55v5ZQqNhyCeutAtfNtiMQXNStlt66J6MKtx2I
	ZrB9ZA4PRHCUbzx1mP2giGHF+yX/p/7I=
X-Gm-Gg: ATEYQzyUTN4c+hhJcLF6mfaPTlkSbAQ5aawYt5wD+hQIktFXJvA6MpgdBSliNRkFGlp
	ssSoQ5YRwzL/nJusKwT+RojyFmIUMPGBvBf4Qv98NSvb1rwaLgWkdgNMj0vvuWEQ7iRQJ8Uc0A4
	bmH0+KJ2IOJ41jAyZxSZMR/d26rOw1whvwSEE8iR2Xaa9CzcOXAt4thC3/QyQSqUqmlvpzVy+8A
	VP4pbdld8tFMF3KVh8IcVSircLuSWUVvCaXTSXYUmVuB5lh2Xbq1Xna69D9J5ZUkYGq7FC6Ii7m
	W4sFIKKbtVj+GSZtn09gV8YfkxrjM/nipTTw7lo/ts6m7l9x2Hwi6WeF0Uygzp0TprXGmoM=
X-Received: by 2002:ac2:4e99:0:b0:5a1:2f5a:cb61 with SMTP id
 2adb3069b0e04-5a13caaeba8mr3635889e87.2.1773158607681; Tue, 10 Mar 2026
 09:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
 <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com>
 <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com> <CAOMZO5CHGssc3Tuf6fJg2_P=bp7=itfDVRANqQOiK2b-2ooeFA@mail.gmail.com>
 <d5bb01c1-17c9-4d76-8a49-00ffd85c7580@oss.nxp.com>
In-Reply-To: <d5bb01c1-17c9-4d76-8a49-00ffd85c7580@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 13:03:16 -0300
X-Gm-Features: AaiRm50hQtki5ODEQm6WBm-CMqmZXFNtS_jtFUq9YGrHeYsH6rVUj6xnzW50JoM
Message-ID: <CAOMZO5A2qG8_d=5S9xdackhUt+DS-YtrvRvNeqA40X4TiVcyaA@mail.gmail.com>
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

On Tue, Mar 10, 2026 at 12:21=E2=80=AFPM Andrei Botila
<andrei.botila@oss.nxp.com> wrote:

> rtcwake -s 10 -m mem
>
> rtcwake: cannot open /sys/class/rtc/rtc0/device/power/wakeup: No such fil=
e or directory
> rtcwake: /dev/rtc0 not enabled for wakeup events

You're missing the 'wakeup-source' property for the I2C RTC.

> > date -s "2026-03-10 11:00:00"
> > hwclock -w
> >
> > Power-cycle the board. Does the "date" command retain the correct time?
>
> date -> Tue Mar 10 11:12:43 UTC 2026
>
> date -s "2026-03-10 11:00:00" -> Tue Mar 10 11:00:00 UTC 2026
>
> hwclock -w
>
> date -> Tue Mar 10 11:00:06 UTC 2026
>
> <Power cycle>
>
> hwclock -r -> 2026-03-10 11:00:31.104653+00:00
>
> So looks like it does retain the date between power cycles.

Yes, the I2C RTC is working as expected and is battery-backed.

You should use it as rtc0. Instead of relying on random probe order,
it is OK to pass an aliases inthe board devicetree to force the I2C
RTC to be rtc0.

If you use the SoC RTC as rtc0, the time will not be retained.
