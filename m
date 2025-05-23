Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF22E62C
	for <imx@lists.linux.dev>; Fri, 23 May 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005516; cv=none; b=QbYUN9E1FwbgvZOSF+FLHcbbiNEBQhD7vc5e7kSaHOJyLOgQdv6lKp8oTrntj4h+C7zATS6ZZUj2HpAQH90HBsx99/hUJTrpPrgx8NsGpJ9sH5ulxv8t1vNRtuvfQv9diUjjzs8zgqopDBKnzA44MO6KBxocgZtbIdV426pXklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005516; c=relaxed/simple;
	bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFfKqdWttTLRvBu3NqapF/D9RPqcb2zkshc5L7zVC0LIDPuyxYRsLAxewoI08D25wzZ4IMO0Ys1Ez7TQXw5RrJaVkYj2d/oWZV291T9NzicrkMSHRH7GERc8W7t6tz97N3Y+ckNOU0s1GBkQsSiTlGfND6CWVwZydRhMNHoU0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCCNfCL0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCCNfCL0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-550ee1cb0a3so11403700e87.3
        for <imx@lists.linux.dev>; Fri, 23 May 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748005512; x=1748610312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
        b=BCCNfCL0Q9xy8lZBeQeZggb/hfV7t1UH3RK3XVb/fk4rTNWH91TzOOqS386PC7hE/x
         H3cPbWJTsjzgxeVVvPK94DdHz/eyaOdk1scAcrkSKRjARNhTtmugbxc/CdfaVbQBmgfz
         7TDw8z+rByLPqWKDo10YKUR52NaJX5DkP16UAVaIaNJnVLhet49wNPFmKfJGHd17lyY2
         e1UuS2sl2PrQV4hEG+o/BLSPW8DVcMxheGvJ2tjdhqIPJzKmQGTK+RwuYYc5oMZim5Dv
         KXr288fzelnx4GdnN8qWlQqR88XGn1kIktNc19qG63WIzCVmv8DavwiLjfrcEL5JpPRQ
         NTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005512; x=1748610312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
        b=Ry1DC21CwYxKZaX9iOZ5B3BsKgg8eruIuKinpe8KgqzYfyVFzNYl/2vndQTRoOwQbF
         7xYII4GH69T2l6LXyfOejfPF1P7gjnczoX2ONNuFUVYbDkDiexwBkg7VTlJbNONOhjU+
         n2qXGHCfWfBb/zdnEfqeO4h+bLDRk9aavBYg+kuR7dd46QGHu6MOsi+6mQle0M5Teix+
         zNZZJHgdf8b30ypDJIElLrdakVqb9KqiCiIED/VEOO2CmeChmWGOTpOp3XOGWpyaBNqf
         ykj/+vZt87KFbmjXQddnzXw3VrgKJraiuewg9uuHdt8Qphi639P9nRFBekPXRvrClTh6
         QSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwGm6rCZT2JHrsBFp0cxjfCyP1i0TlLT1aaefBaCygtpcAgwGjmadeSFzUW+WRT60dzhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaDQetrBgeX9gSHxv9BC/1uan8BVSoFWOUPE2FgDijMl4zg/uw
	tIQctUqqDlbMTQedT6C6yPCTPSbUOmfCxdxIEdybLWDyUkWXUFHWY/PwZ0pQIz+wjzVnAloOoI1
	6dXza5GMmHPPdfa0qzLjTyIZP96y38F8=
X-Gm-Gg: ASbGncuQ63nu8EsZeQrIvwk0L3Bl+8ANao72lw7+LlPQ75AH4gNVrqel/sU4Dd7KTMP
	PD8cTvPH/3t9E+mhUvaGNyae2V7DxXmeu1w+L5fgnQIb66WqNg4Iq+DzkyP1mM3+GEdaDhsLRRW
	r1BVRGpFd82M7oj4UYAblNOtJbQAt642gk875tWPIdH6xZeCObwSQDjdUblG9lf2G7
X-Google-Smtp-Source: AGHT+IGr3CXT6N9oc1FChq+L2zQvwNAD13bnITSFZ0E/+/W3e8EL95eryfIkki8B2q4B/f1OTLeeKFeZTaRvi6X9Tc8=
X-Received: by 2002:a05:651c:1608:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-32950c5a0demr9757581fa.25.1748005512185; Fri, 23 May 2025
 06:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
 <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com> <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
In-Reply-To: <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 May 2025 10:05:00 -0300
X-Gm-Features: AX0GCFtNxWfmT8UPK_lUQ62v_RjY-1XASOWkmtujernBQbwR9phsII3yQ0Wll2Q
Message-ID: <CAOMZO5DBL0BD_YbByqTHRGq_FkxG9vD_ycXiPTJdQ4WfmKfitA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dario,

On Wed, May 21, 2025 at 10:20=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> So if you're okay with it, I will remove all references to the LCD
> display =E2=80=94 both from the commit
> message and from the DTS, such as the reset pin, for example.

Yes, that's OK.

> We have two models, one with 128MB and one with 256MB of RAM.
> What's the recommended way to handle both cases?
> Should I define a new DTS file named imx28-amarula-rmm-256mb.dts
> that includes imx28-amarula-rmm.dts and override the reg property of
> the memory node?

Or maybe you can describe 128MB in the dts and let the bootloader run
a fixup on the memory size, adjusting it if needed?
