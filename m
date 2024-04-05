Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89EA172794
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712343964; cv=none; b=aZYfFVGRj1V29MGFml0uLMVEtHMLKNdzq67I7D5hTxTTLXxy+7+xD/rEBLPWtVu6JUIL/OwYfkGV2yA16hZUCuoLMdfLW0TzZYZ31S9qSP30aQ09/8Zq2SUJ5yx/JdbffglWJNZMLZ8mquX/55S5s8GFutCGts+4hppoSQ7S+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712343964; c=relaxed/simple;
	bh=zFci7/zQH9wpVuV3O3qwf1utK2Fw0+XCVQcYfefS1Ss=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=l5sp1XD+ELoKQlwxm72pLFRubjAoYhOlo7V5TAGjNSRaIBn4QYj02Yrm5UPuOZltU9ED4t5cGqAGS/mbQCziEH9OAOcGHDKS/BAVg6yn7Vx4xOwNIHfbFImGZiRswsY2ghZD5AqMI0BvrTHrqomD//5IW8h1GuXgQcGLxY56DNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdwjr9Nz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdwjr9Nz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d536f6f2so1118185e87.2
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 12:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712343961; x=1712948761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zFci7/zQH9wpVuV3O3qwf1utK2Fw0+XCVQcYfefS1Ss=;
        b=Qdwjr9NztTYGrXKj5lVeatFiUbe6b/6EDvajy/NMuFLurlItCBKtayaVvhG3gy8IAl
         HHdc+iEXjJ/wnLrTKLQusUtvQwz8FF4Y0AFFzaz98Xclnt1yOe8IRu7eGMQjSP0XscYA
         usNrCdTG7YZkS62AH58cywGXQ3MVUNIOGdEbI7Cu/mMm8qRoQ2YIn5PcjL1ci4R0PNE3
         KEqTA45am6nDE4eAkYQExHzMjRNLYRTq/L2TvxQb4vUPRGrKM7aCK2H+6fOOHacIVNcq
         Nc4Wa/l6MYvss9uFi6j38BiCjK3xI4YPP2ptL7bB/U8CR1pWB8bCwvuaKhibjADnjai6
         cCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712343961; x=1712948761;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFci7/zQH9wpVuV3O3qwf1utK2Fw0+XCVQcYfefS1Ss=;
        b=l7atUEfibr/3R9OPLsiehzTsWqoPBEDxgLv57QxnIifnESLJwavU5jNaV9aHtWdW/y
         1uGyZgL+f3xoX/BDr+s1c9AWQ5rK1GupXoFydnybyotFS/DkNpYA6y7mmtNOnh8/gmy3
         S3X6Efa/B3EOSGhs/o2FZ9pzRF5x0Z3N5zDe/5h6Dbs0jIivpdvek6bOYXuPQgGf5fLt
         WIyvAxQDPsmviUPUigYwEF3994+t84Fleo3+5Tat+lyjMp2DbNZ2TGT4LQQLBLvB0+VM
         jsX8S/ap/FueJj0E4N/eryrUl/4TkBUmRe7DZiwjiceHhqPPn+09cElNLJdoyASKMgK6
         BOxA==
X-Forwarded-Encrypted: i=1; AJvYcCUnN/+MbcNxHW1wIWDBOLHQpUBhIrTeJQEnwfVa43H5poHHktRB0oYwKye1LdTRjnfhjLS2RnAzU0RvR736OhWyrDk+
X-Gm-Message-State: AOJu0YxbRrcM0CfDQtCFflXoawV/2xKbLtQhcnO8alpRmFP6zTw4I79U
	4M5ZFPN0bbn8phhPJnpBC9JF34ISd4E7wctmA7X9jL210HhJ1rq3p/V3+abK
X-Google-Smtp-Source: AGHT+IF8d6Tm00RPEfua/VpB/UdPM5cBubuR1FNzA5BoxG+5BDk3l4sBzRGKEiGeYtOcwDOUKS8BQQ==
X-Received: by 2002:a05:6512:ac5:b0:515:d3dc:43e with SMTP id n5-20020a0565120ac500b00515d3dc043emr2267678lfu.51.1712343960384;
        Fri, 05 Apr 2024 12:06:00 -0700 (PDT)
Received: from osv.localdomain ([89.175.180.246])
        by smtp.gmail.com with ESMTPSA id d24-20020a193858000000b00513e466cb0asm268120lfj.5.2024.04.05.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 12:06:00 -0700 (PDT)
From: Sergey Organov <sorganov@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Esben Haabendal <esben@geanix.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jiri Slaby <jirislaby@kernel.org>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Marc Kleine-Budde
 <mkl@pengutronix.de>,  linux-kernel@vger.kernel.org,
  linux-serial@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] serial: imx: Introduce timeout when waiting on
 transmitter empty
References: <76cf9ce9cbf9dcdf78bc00ce7a919db1776ebce1.1712309058.git.esben@geanix.com>
	<CAOMZO5Axz7un+9H2uEoQtE0=pYNC0hEyZiNobrSi2m0ajj8N+g@mail.gmail.com>
Date: Fri, 05 Apr 2024 22:05:59 +0300
In-Reply-To: <CAOMZO5Axz7un+9H2uEoQtE0=pYNC0hEyZiNobrSi2m0ajj8N+g@mail.gmail.com>
	(Fabio Estevam's message of "Fri, 5 Apr 2024 14:38:48 -0300")
Message-ID: <87r0fj1vfs.fsf@osv.gnss.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fabio Estevam <festevam@gmail.com> writes:

> On Fri, Apr 5, 2024 at 6:25 AM Esben Haabendal <esben@geanix.com> wrote:
>>
>> By waiting at most 1 second for USR2_TXDC to be set, we avoid a potentital
>
> s/potentital/potential
>
> Could you elaborate on this deadlock? Have you seen it in practice?

I've stumped upon this piece of code a long time ago, and it's indeed
broken. However, to actually see a "deadlock", I believe one needs to
enable hardware RTS/CTS handshake on the port, then, say, not connect
RS232 cable, and then printk(), if enabled to this port, will soon
result in the loop to be executed forever, that in turn will hang
single-CPU machine entirely (provided this code is still executed with
interrupts disabled, as it was at the time I investigated severe
printk()-induced ISR delays).

-- Sergey Organov
