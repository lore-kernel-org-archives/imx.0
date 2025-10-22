Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A812FB617
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164783; cv=none; b=lr5nuLo0QSqt2A7ivNbWRgSj0emgAqUt9zjeuF+ja4MIVeUXP7KVBXgLXCN4WYtX5qVJXJFdBkRv3g+VGRQUpdWjQFVwHC8hzcBWptQatl6KIBN0ByQCl4pkZ5DBQUuCDY02vlbqZnActP6xJH1yAQiltmve63qjgpGEa8gNSP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164783; c=relaxed/simple;
	bh=DN8wIHw8L2THEi4S5dHy5jflBlp+QDhGYC86piH+GyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qh8bb6ib4YIoD1K3ckaDvspjX4kcEPRRdC9joGfntbErEVsfZjH1UUFoF1ugUURHWVEFL0oVCoQ5g8EI7gFAWG+9V+TIHQ6EqR3ZjYNHbM2CRqWQd58NkctDgWL9GWYWlnubQRl4dGs5L6wKXtDYl11+v/PXEU6Bh16ABu6RoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6LmwWrw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6LmwWrw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so68233b3a.2
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 13:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761164781; x=1761769581; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hAf3HpEiT48jV3m4EHRH16LKqqSsX+cW74wRjoqq3Y=;
        b=V6LmwWrwIDDt0Dmh2Ln5wlnSbzg1zadrlSzF+/irEtj4zD6t7dBMhp5l4A6DajcM0B
         tqVKDvx/oZdVqS0B1yA3XXLYpQ3/sghDJSl5R0eNZEXNRx5zWUMEfRr+VRa1cOrFX+d7
         wd3Z4/m2VdHE2ryBe84HwHdT/dV0+PNJnA+DnN+Jmb0opNHyHVnm4uShyIMcsn5Wfmxi
         u37wbpwtsLoFLbYaOg/VzIdJoYea9zOUVqnowEqDLyzWkA7is6XNIf2MY1GxUU4N99WE
         k7Fb4EYW6KiPUz2merHhV9rJyM7kqKBDrWAAAjOOLmblOsdg/jEZnvgCWxtQGh/IZNCt
         G6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164781; x=1761769581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hAf3HpEiT48jV3m4EHRH16LKqqSsX+cW74wRjoqq3Y=;
        b=Wd8jQZh2tLUFPl4qdr6Fkkw5spc+8kqt/T0pPmUNGNEf56c25/74TGca0fAS48OwHd
         IDH1+CM/5CHj7Huqn4ydvoZBavmpfKN7+lMyVOot93mKYQkb1T7UQX0TLNoaisWytoj2
         4bPzU0/b1iilPG7jGGxXKm4iV5nJX4Dz2pw1fflW4vfnI+bK2JZC2atvp3Vp5trvyUAv
         4ko5LNe21fLWwa/QX8ABB2u0vtQHhfsTMYHqKdgIG+FKKye25o5Um3ndLGT5S64d4bXX
         aiIA8SfMe8M397UxiqkEEYKHLJfRgv1tgDnaGqPFh1XkbjNJsXRhIKaBC7F5QUQ4rs/a
         xJgw==
X-Forwarded-Encrypted: i=1; AJvYcCUpnj8knfU8OGPRN9k935k0uqswo9F1arxXXkHCVAfVCpC2zEbaZiHho8gpRQkjnl0zLHc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtS3Yp6xt4PFtj4BhrfVXwcoEsSoh6Z7XihSBMzEAhZPM+QVVj
	InJxspzgYgj+ioujWRu7msKfntMg+MeNq7Kk2hLQcNIUhPPZtukyYpKf
X-Gm-Gg: ASbGncvGRg62CYuWnxeg2KJvyHevyRN0Dm9u1ZI/8SSA0mNtfR14QyOFDm6isaWfTr9
	e4TgUOOztVQ254aKm/Xolod3RzZugDLG3c6Ss6LdvgBfg6vnkpwLHQqTfu90kPVTBKAMChWs0kK
	YVYP9ecwxpV09LZAfkVEy0c9hjiwZudn8JBML7KsF+D2l2fsCAyXmI2iTRp/4hpvX0U3qcvOvFb
	AzXHZz7PVOLzK6/engrfcp2uzFz2lEEDbNY4+gUoPxLk2IaNnSDhmxxYYQ3SAkF+uZZ0laCmP+h
	8QwsTTEh7uR9sZGdlKtY1ZC/Yiwk4egyh+Tl/sCLTHT2ubUhwDXhVvA7tjuwI0WBo/RT7zTiaiU
	AAJKMAiCmgMpSMup1rSlwVFSmEVVGzOkEhEF5PyycWok6Poj7pUQg/3JHM/dLqsHyNqyoIQjZhB
	d0L+6R+cE8CemvNF4I6octCeZxaBKUiOMA5Jv37HI=
X-Google-Smtp-Source: AGHT+IEUWrw1/NIF6k2oNyNi5aIySqQPjcH563349gLGnf1V8S0/R+EqsrCwP+l1wUXaJawvs0BBZQ==
X-Received: by 2002:a05:6a20:72a0:b0:300:5f0:a4bc with SMTP id adf61e73a8af0-334a85bb055mr31514224637.45.1761164780878;
        Wed, 22 Oct 2025 13:26:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb37dbsm101523b3a.57.2025.10.22.13.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:26:20 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:26:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Job Noorman <job@noorman.info>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] dt-bindings: touchscreen: consolidate simple
 touch controller to trivial-touch.yaml
Message-ID: <vv3bpf4t2fgj2iz3hbevw3u33phqitfd2x7mk3ow6iqrjownbs@gab34yb6o2ee>
References: <20251021201924.2881098-1-Frank.Li@nxp.com>
 <20251021201924.2881098-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021201924.2881098-2-Frank.Li@nxp.com>

On Tue, Oct 21, 2025 at 04:19:18PM -0400, Frank Li wrote:
> Move azoteq,iqs5xx.yaml, himax,hx83112b.yaml, hynitron,cstxxx.yaml,
> ilitek_ts_i2c.yaml, semtech,sx8654.yaml, ar1021.txt to trivial-touch.yaml
> to consolidate simple touch yaml binding to one file.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
