Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F69736309E
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420076; cv=pass; b=ktL31zxdrv0Hrh8PTuPVFRrvLn8ulnOMptuw2R1tVWM08XQO88QcVvABr+cDhkRS0Ntg2l2OkxjcebMiqrtfhA2f5HiXMMXw5ZDgEJFPjsuXYxxnqhL/PQNbfHaf06Q6Y4hnF9GXwy//mCoxlp7+A4VQ+OoZY9bWBAAw6oPe6yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420076; c=relaxed/simple;
	bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU+nr4oQGvy5duuIuqoagwalua0GRY6DcxSdLamMUeI4SLe1CLUl0nbKxdBlTeOXCHQSIJGzI7rFXDQjWfea/cOY8NgC+c9BHQOVdedujTZXP0fHl6u+YndrccHtT68JmdEegIMdCvlaV3AofHftiBE9rslKu2Eu5I2RWhIqUQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaUDyrYb; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaUDyrYb"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-386b553c70eso22681571fa.0
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 09:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773420074; cv=none;
        d=google.com; s=arc-20240605;
        b=W844AJGIvloYcA5yAqrWRoQk1LvaZ8WyzJG2DVS11cCpMOBmBF/8Zzf4DyDX2iQoWZ
         GxMNeohvY3qpBA2aEDwh2e4bvfpEd5NccggSk75pgl/fhRpcIOgq4sV/uU+d320JUO2s
         Q1QgYXlZbE7lCf2fYZQEorYNRlsRaeXAgGCZjtlUyRQYRNeoGupVLzb7fE/aT0gHC261
         DlVPXQGl7PVvj0di5+wfCb70mt3AF53swOEFh7C33dTABqiz88tS8WXOfcB2y21tU9uq
         Izkrihl1/PCNXKwdKrRSf9F0v564D1Lu2wHMw2bqGOrw7el/BXu7ZisqoMTXZcul55iB
         Eq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
        fh=dZznfaan3XKkZjpNvx7AL5DG7he6bwVVCpdiaLaHysI=;
        b=dK19G57kfEzS8ga/p5ev+Fj2Bqs7jtwp/OdwUNvE0bveEVKoyD9Cj8o6UBRQc1oypT
         VLb7e9FIGNfHTeZVtbVZjYwoB3F+8jMFgKTXfLoIstRb4o/yYb87ogN2UovEQC/lJUsr
         dm88MOnQKbVTzxIwKUIjFohd5MsWt9cWB8VNZDyKl8AVGeqyvqPkYVJf8AzoIhrSOx3A
         We8DAm3TfulFjdCowdfPGr+TMQ6KMbpPfQM/2gSkzdDkpSJPwMkvRk3Tbh30SijxAy67
         eX+1JEUMpJCpTqu2fBCUwOdDzX5FovTjLQ7kSLkMR1RdeobNIvb9BaIR9FERBl11t/KE
         OWIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420074; x=1774024874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
        b=EaUDyrYb0PuinlM/1g+5HD+swK6lu+sXiVRWpNp+7TdwIVnrbwD71g4D3IfbPJHoxa
         xcRiU22eTAvbnyBWfjBcgQPUKa4LgBd3nf7KQZba+Q1aN4lz118E+2h65lUccZ4feDDO
         v7fo0Z7FVAYopqTsGcWiA1NuwiX37KE9NuikHYxI7NDkl+/YF8+wI4C38X1zBlAAZ+DK
         owPvB0IckMjKrI55y6IxYQtu7L6dsy3m4q54oUYuSK0X/XUR8AepmQBKqlVUV8/2r39h
         AKmX4WAaPeuNLUscD6Ss1SqdgTN6GeubOG0kfv7GCG4jyrOhmmx+XTtCrwspNfzA4ZH4
         a0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420074; x=1774024874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
        b=m8Ohx+l0HsgIHwvDC6XNc/D4F0NjuGKlSNekXNb04W/vGESFOjFj3EpeCKtaMHQTeK
         qcJ+Wnb+LE4qK1eJAYrQLVZH74xrUH5Ptk+Adotu+9eteU9AVDfnQMAUSbH23d+3t3re
         XR2W0nDtl8TRVC+rn3YqChzRSS/SZe673Yl5GU2HSxIQ0YOKzpTHoIfSeMeK4JGOs0Rq
         RGGZlBLPoxpm+NMAjkCoNLYgIJfhvRFDnEh2KbSZnRlr/1/znHJemu0o7Q0nyzI45hW1
         /z25ktrjYykxQC7JPJQ2/G2EVmxNJC8LWdkHJ/ru0mOmwfDYjm/mUAsO+ZOFXlj+LeBF
         d/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhMv5E8OVpP0lGZEral0g6R/DutyYtp00GpK54ozUAm4Nl5E7+cErmdMQYurwE9nFRK4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuyoG8/bzBzCBkGh8P5wN0ydjiobO61b2ZBpZCrKEusIys/vBO
	BMmS43NPb0zmQpv8tS21EmKTPRcZjMlXonllgLCGTwwOQRLq/4PzkzlgQMBCHe1O4oKbfzP/ASI
	wQ9w0XwgaM/q/9J9daIM2mVL8ouP0/WA=
X-Gm-Gg: ATEYQzwMF97OgCCRn7nMJ3f6dTzNXkLsmwSQGuYc92HlyBau3araya637DvyuYBFGye
	4/SRRKHX67Bzz58MZV0F04WURlskjQAAaNNmSLeFefxlWGzTGX+8O1GSVYXSZBaAjZWSl8vAvyd
	Ie/DUG7hdaDFJCJdYFhJL1zXNalWhukK3yGvn9iHG2czWASk6sGplNfePEM0a9lyQzFX4ZxSWj8
	ViRzKzcG2ELSTWYtQXqXdsrcXML8eWApneN2x7jKdMoXMmQod2ys/jiHWxcjWnQ9I6WwsJYZDC1
	/5RV/TYQ2S4DpzH0rGrepB7p6HnWSQI/QgoGUIUvfagDp2efu0RghI/b450v6sNCaLduPdkQ6xm
	WNpWDfZ4=
X-Received: by 2002:a05:651c:411a:b0:38a:6acc:85f with SMTP id
 38308e7fff4ca-38a8983b635mr8205961fa.36.1773420073322; Fri, 13 Mar 2026
 09:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772898346.git.stefano.radaelli21@gmail.com> <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
In-Reply-To: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Mar 2026 13:41:02 -0300
X-Gm-Features: AaiRm53S_d12Zw5UGPcEotGK3352SUR9b8Vel1YzgYrE0c2WVa0HFOKlHx3vKPQ
Message-ID: <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
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

On Sat, Mar 7, 2026 at 12:55=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>

One From line is enough.

>
> The VAR-SOM-MX8MM currently integrates the NXP IW61x wireless module,
> providing WiFi over SDIO and Bluetooth over UART.
>
> Move the wireless module configuration out of the base
> imx8mm-var-som.dtsi and provide dedicated variant includes.
> The IW61x configuration is moved to imx8mm-var-som-wifi-bt-iw61x.dtsi
> and used by the Symphony evaluation board device tree.
>
> A separate imx8mm-var-som-wifi-brcm-legacy.dtsi include is added to keep
> the configuration for the legacy Broadcom SDIO WiFi module used on
> earlier SOM revisions.
> The Broadcom-based SOM revision is no longer in production, but the
> configuration is kept separately to preserve compatibility with existing
> boards.

 imx8mm-var-som-wifi-brcm-legacy.dtsi is not included anywhere, right?
