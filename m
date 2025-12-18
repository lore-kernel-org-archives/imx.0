Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86934E776
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072868; cv=none; b=naAVTGyvsPn/XaBBuT6PjSXe2V17+om7g4Cy97Ux94NrvXHXu+fKngyBgbowo4QyYP/7KDBJUDEWcPqhLvJ+AOJjnymzdmZhvTJv6pm6xKhqqtIjnvS2DbQJ3U5ZTAbHqNlY4LJ50EhzTFMPvMlnrbjlCV1363Nj9ki+D5kE8KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072868; c=relaxed/simple;
	bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed3eCqK9icYyHmJrv+ct2Z+91tSwv/i+UzeOlLtt66pmXwOlXzfgiHYt21TUD+D+u7+Uugj++AFgvaA+4YX+DnhGspttFqxHtLR/tubxm8FHyLwk+rzwDizMsGP6nUlqWWc4OXDc4dDJJZk6F+3GgV4+HJ5zo/6B+McUBftzx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESvHzK2a; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESvHzK2a"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-595825c8eb3so872756e87.0
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766072864; x=1766677664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=ESvHzK2aolmRB5RjCH9NsRyxAxqu16gnqvu6GhRJdMBSqVAQC7MyB3Vthr6bwOYAB9
         YAYjyP2aM0hkiTFaQCNCrVKJ4N+cyMB0aKNgkyRc8qxwIPVEXXyTL4MUyzG6DX1Uz9A1
         V1jBpwetrw0zLYDi9OXoMTw+wuIJA8vpnWORrrubi99HBIig06KJ0Y5oHwnh3yaNBEUU
         TKnPbWglIOcLKG4n6c5/j5QrC7kST36Ea2AsR4Z2gVmQx8G0OMnSuX8FTDKi7/3oMAyZ
         ubKqG8WAzlh67Kf++H/EVrTc0yMJ66yQ8MazFH3jvlNGwXS4Lp98xVIa4YOaAZp8rCUG
         rs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072864; x=1766677664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=iZ35pTMVPdTBEhZ2tgoXkaUGL0nRUM7v/h+sxuNs0hPSw94s0SX9qLxh7TyNYmG7Lo
         9Huj08YqnkMb8Q/BcWbibMbgi0kVI4e960lmBrVLnh+W3X8vvu4eSlRPlsTBZPh6MfVf
         of25Sslpr1FDVeBEhm+upxrmacTi+fw9v5PDhKWjy4hP8V4LsB6y/lDK0lteOi+DlcMZ
         dKEWCKCV7+uDXjfLzEq+AI/lDJzN/zG1L8h2ruiDsEUrhhXEC90nOPWWO0TovBEFw8oY
         +wM4/MzHorHePXuaCXoAb8LmGnRppM7thtgVZVMfCqblOb2qREmt2D+u7nicUuJwEUuX
         kDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgM/hoUlZ4/0MnL9C8DcAhqnkTpzqtUFLb5xGywHibsLgkNAieQ5N7MRuIKsh57BeMZ2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaxAQD90fMS6ikQnverFdo1Vx+YCvV3YxpB2ho5rXibW5xakid
	49v7dnNm85bfQqRzFN9vNUhrlZgdf5vrgei9m4TQVml6N+NuY28Ap0msThv/YF4cg9jsDFoGJOW
	kSPVsMnS31Nx42hhQ66PFj+o0F5F/Hbc=
X-Gm-Gg: AY/fxX6JMfhoGgU6n5OVLMzmvCh9FOReJiHX0OqYGcG/e7qyIn6HWAEcGyHeHfF4mB2
	EvpttkofbQ8bHrS6uH0trvoRC4/WrHoErypp/B8u7aipSGqnkK7Z9YaB2Pj7UESxw6+shIjxzpR
	8JiYSBEkEFORerLsMn1qgjGinRonvycHe7rW6cRB/F5QWtkWeHh6w5yDJ6KaYV6WQtySF5OuRzn
	uJr8Em21EEGjzL06SxpMnq3DxhbspOes6IzvQLMGv+cx8I3aClTVz2QXVCURv9+wA6No7X9d81p
	VAAABw5BA+U9FOH3cKKAYpbHwO0=
X-Google-Smtp-Source: AGHT+IGrYbGUckFbA0uI/Uak1RoxWaGizxcWDMRvFWxpw/hL/+bdMgS3hQvghW4USBbg4LCsrOKENWVewsmE9VZ7WWY=
X-Received: by 2002:a05:6512:128c:b0:598:eaf8:8f5a with SMTP id
 2adb3069b0e04-59a17d573afmr14623e87.38.1766072864074; Thu, 18 Dec 2025
 07:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Dec 2025 12:47:33 -0300
X-Gm-Features: AQt7F2qc4TJ7gyArwoED7PIRPB0eAsifB8ZnC9eeMqM3yyZByNJJ_XOF-WESW6g
Message-ID: <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> * TQMa8QM on MBa8x

This commit log should be improved by explaining the SoM and base
board in more detail, providing a URL, etc.
