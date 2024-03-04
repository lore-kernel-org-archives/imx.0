Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292B38395
	for <imx@lists.linux.dev>; Mon,  4 Mar 2024 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550608; cv=none; b=Q4pMHEGUpj76N8Iw/kg9yyJlS7w6tmj2jDH/4gJx95RQzUp2/F94n2izxmDatC6myAkyriazfUmGQNemmx2m7T5xWeHUCBgaolELwtGsNxASzdxYpNCf/gxjHDwIAaA/2gLmZCHMNART0dwsKpARWgwyh0wUYn5Prvt0TY3xt64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550608; c=relaxed/simple;
	bh=8rBw+8lavQNu3WP5WN/y/f26LqjJAVlqi+HMskTiDyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JG6SMmJUotaQL86mqxyWiRTVm5lkr1JtCAlmGZtRTJh2zJyTXUadKbD5ExQ1T7bynGS7GBL2ayhSvAWpo8+QoODRFIm9mPApeR7wumOtPnXknwijzLmtIrb//qls+Oe/CE8BmHO6ZGIP2CZkLFh2akp41e1NWJ5Hg5D5m4gtYtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWLCc7oJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWLCc7oJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e59bc0d8eeso778438b3a.0
        for <imx@lists.linux.dev>; Mon, 04 Mar 2024 03:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709550606; x=1710155406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rBw+8lavQNu3WP5WN/y/f26LqjJAVlqi+HMskTiDyI=;
        b=dWLCc7oJ7UFaDhxQsg/zAfmJG4iN2gsmTQ5QhGrz1362hfp1m3VfUOW2/LOZLDcfzW
         LefnW+SeDXoGqac8vhU1fcpYqbXDTOe8WIq3FRvCsVR2RFXCH4UCus6EeW8hUA9zqG+9
         xDw0EbLykS3FInwqKXLPIb//6ivzcGEEIKWPYhE4geUO7Aj8zRoV6GmMqns32D7hBc4w
         klP7Y5PdsbHTez2CBq6Xyt1ewWBmc0lmSQ0f20lft3tberwAzeMTZjN1zwW9PAA8F6RM
         iqRj1SDQKVPkWZFSlm6wudmTuE4fKpHutvR5K5r2RupVPrX770TOHS+eDVGfXzkxkmt0
         6Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550606; x=1710155406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rBw+8lavQNu3WP5WN/y/f26LqjJAVlqi+HMskTiDyI=;
        b=Keih6q2J8o39JZxnCHIW22rdi99waLZ2gKryV6vYcE+p2XHqEdkM5HtAnBlQlusWBH
         42NH0UqQmYwP7gpog+1+z7SssCSWPp1T5shvVgc8QeNehJkumydIbq2MF6S7YjCTrbpT
         DF8ueGJk6II5X/SF6SsRfWqdh+L2ql0gd0AuBmimrPtD3q5HOUtUd5KDiuASwYpZ1tB8
         2ZyB6N9PlBa5w86KDLrCDDQjOqYAylF79dTf1G4Op1CeT2YHkMxC8dH5GdPaDztU14aQ
         yI+8EIClxIVtnoZho1ETTTj3ik7jPRNhiG6jiXsAL/QDUobQiF6+Le0nuu8waxpARz77
         4lTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPV7GKxUc40HGMpxIDLLrChRBzmbQ+LxHbQJtV6FyWk9HCZV3J6HL5lPYM6wPKRX2550x9MRVwGzp55uYxV+PBKlWh
X-Gm-Message-State: AOJu0YwgK955L8h/Z6AxTyGIlb/hO5qLgsMalhA9nKSRKIesGAlW1+Vl
	A7o4cVL1HNtcl4h80ZcX8VKqIMms3JA5oANRaPDx1kDql6i2nO1yqq3PAtoc1Rqn07+UeKMRzRz
	PIqoOTLmabg/AV3C/QJgdbqmoqSWvYp/w
X-Google-Smtp-Source: AGHT+IGw9TbaXB4OiBViXULChFw8ceMuWOdi0bShk6CdU+4WddPSCqd7UQSgJO1Yt6fZTZdAk8xHZza2uny5nD0L8Fs=
X-Received: by 2002:a05:6a20:3ca8:b0:1a1:276b:e116 with SMTP id
 b40-20020a056a203ca800b001a1276be116mr11760741pzj.3.1709550606198; Mon, 04
 Mar 2024 03:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240304020712.238637-1-sherry.sun@nxp.com> <2e1b1eae2e9d3cedcd270e35cfcf8086b914b7ff.camel@siemens.com>
 <AS8PR04MB8404FEA637E51E3B258BC28C92232@AS8PR04MB8404.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8404FEA637E51E3B258BC28C92232@AS8PR04MB8404.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Mar 2024 08:09:54 -0300
Message-ID: <CAOMZO5AUFsC87fivJ7UhLGpoqy+-rfSx8Jipp5QGjQ9uGOngTw@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: fsl_lpuart: avoid idle preamble pending if
 CTS is enabled
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	Shenwei Wang <shenwei.wang@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"jirislaby@kernel.org" <jirislaby@kernel.org>, "robert.hodaszi@digi.com" <robert.hodaszi@digi.com>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sherry,

On Mon, Mar 4, 2024 at 4:32=E2=80=AFAM Sherry Sun <sherry.sun@nxp.com> wrot=
e:

> Hi Alexander, good catch, I will move the "/* restore control register */=
" message to the appropriate place in V2. Thanks!

Please add a Fixes tag in v2.
