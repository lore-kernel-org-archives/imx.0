Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2E42727EA
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456303; cv=none; b=T6Dt6wff99exOVGj6MW+Abt10OrLMjw1fv5VR0EOX5/4GmORN6FhwJ5WC8piRgKrzPJUOI1GzI7GkeoILzBO1ryrnPqm9RHLtMkOfCj5JXc+JP01jsKJhiqe7W+F2AbY7ca4r67WXMZ1J87K4gvbdz8+x5n4ZwwC5LkEOnETMD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456303; c=relaxed/simple;
	bh=GzOUkXuuoBWn+/0sImYm2b1vQ4lGKBCGEV5jyRpMqTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYjNSC3ikJ3dEO5M/XfrUk0BH6vonA+1dIwB4/hSvH/69WihTQfFfQh8H9EFXuFjDRYNMl1AOk1QNlswtcgiRxdaS9YBae3YSQzcWds0vhhFqayeqWxJXFYPtt3Yle3vylR+ppHuK9peJ58IbgaIZjlod/ZcNJSeZFky7uskxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffhpn5ua; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffhpn5ua"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59581e32163so43604e87.1
        for <imx@lists.linux.dev>; Thu, 11 Dec 2025 04:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765456298; x=1766061098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzOUkXuuoBWn+/0sImYm2b1vQ4lGKBCGEV5jyRpMqTg=;
        b=Ffhpn5uaTzVgotWxH+iHD401xb4iGOrWVVsiitMuJIVMJElBwNmq/Resyx1x4BY/Km
         WU+G+D+VVg6838U17AA2oXkMuDQSj+/33bxS20z3VzX4RhB2FSFPOU60ZwDB6bUoUqeH
         L4hoaXYLYb0rQlWDHW9+d6iO9Wjxbtosp+a1x/IOfIU3kCvNQeHjXNHB4Q/6V2ticNhq
         7Ji7tU1p2NFKeoYX5EES7FoDlvDvmiI4ARZj3WCye6jHUmbxztHLxPPhSb4CwwoLb8bC
         Y+3iS3hV0FsXLMD2cfHbNU5+gmO0c0P45mBeGGKTC0EljKJo+iZIuDI7pCihL6LYKYvx
         hcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765456298; x=1766061098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzOUkXuuoBWn+/0sImYm2b1vQ4lGKBCGEV5jyRpMqTg=;
        b=XZSppAJhddOBDBaWRqPu2mmv3Z8RfqQvXnoTPqEodCENDndhAi30oS0370c4izK1OI
         zlvXAz1iIE1tbTk4BGHDa+bitl8eYENgT3Q8XC/LGrgjKz6f+Bij6Z6Y7yMJniKGb2/L
         l7mA++HCYlutmvB/jNzWW2KOLYrCJ8TXQhu9gIOeh2aku+orvZvFwVVigvm6q4TGtm78
         YOvgpomNcfr5fvMcMEPyXCZ3k0PcLkrU1Sg+bDXZ5In3/NKZPiXPl9K7bBAfzRW60bnC
         UwSmOR29NPrbBpVYSwA8020stFagUt4VliKKowUoy+eYydm0yxvfOA5jMQSRoN5euC53
         oR/g==
X-Forwarded-Encrypted: i=1; AJvYcCWyicDPw09n6EhwnBvsYiTrSCgKTWYPNH0L7X4ZVrqOWnB7FFzXGMyB657fskTQ59F0ooo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBREm1q//x9P7eenBIH3byWmnueleysl+4vrLMSdDW9kjyWbOC
	qoUdkokED2fWbS/F5U1OLjgVkv7puaw5qqTGE2KJSCRiXL+wc5M/dOAX8jG+NGF9+BwGb23ATKd
	PbocZjOJi6QTx/O6DWT3S/2t+HpcDb04=
X-Gm-Gg: AY/fxX59IvY0W+F2n4ruDV9CFMZyhY3raTq3LOFMlJl34TL049V6BAtEsrd3Op8ExFW
	8U1EDwRluK63hsx03CusnnZZyB37qjKNAn4uI6edM5hz68t5w0kZ4KLU03Ep2Tqjf0vdVU3o01c
	CAZAGTym+FBhgIxn3sKGE4MzATItllTr3Do8pJ7gBuhAtd6MOOjzfHkgVQU6kTUYFqX/nPcXuGs
	746r71yA037BM9onYkO1wNoQmap1m2wtviAdmLuS10N3BimB069w4u9wcMkW+sqzU1Z1y5vBps0
	qcy9qc/WpM5o4U0D25iQ80DV148=
X-Google-Smtp-Source: AGHT+IFx8jB4DP/C6ch3hkvwp/hBlfDTrjHCBEs1ezVD9RnwEVMofSDStV8tSr28ue048X+oTa16zOvCrjQLAgrohPA=
X-Received: by 2002:a05:6512:3e02:b0:595:7fa2:acd with SMTP id
 2adb3069b0e04-598ee4f3f6cmr2412583e87.21.1765456297571; Thu, 11 Dec 2025
 04:31:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251210152000.42265-1-stefano.r@variscite.com>
 <20251210152000.42265-4-stefano.r@variscite.com> <CAOMZO5B2__4qgJRni=DPxd1QoPQLwO+r9ZbdbsOWXZemVU86aw@mail.gmail.com>
 <DB4PR08MB103414303516B7FAFF29DB571E9A1A@DB4PR08MB10341.eurprd08.prod.outlook.com>
In-Reply-To: <DB4PR08MB103414303516B7FAFF29DB571E9A1A@DB4PR08MB10341.eurprd08.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 11 Dec 2025 09:31:25 -0300
X-Gm-Features: AQt7F2ogc3apjlXRADhBz8DDOhM7cjdSocB2OVTGdMTU2QG1NnJjeFWnNeR_tbs
Message-ID: <CAOMZO5Aq8iO2w7MsQz+BCNBsCUEewApoU=keGjSpFMZzSwhgyA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] arm64: dts: imx8mp-var-som: Remove UART2 console
To: Stefano Radaelli <stefano.r@variscite.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 5:08=E2=80=AFAM Stefano Radaelli
<stefano.r@variscite.com> wrote:

> you are absolutely right, the Symphony DTS needs to provide UART2 (and th=
e
> other interfaces moved out of the SOM) so that users relying on
> imx8mp-var-som-symphony.dts do not lose functionality.
> For this series, my intention was strictly to clean up the SOM and ensure
> it only describes what is physically present on the module.
> As soon as our new V2 symphony carrier is ready, I will submit the corres=
ponding
> patches for the Symphony DTS as well.

This means the series cannot be applied as-is; otherwise, it will
cause regressions.

The move of UART from SoM dtsi to Symphony dts should be part of the same p=
atch.
