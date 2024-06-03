Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964414AEF5
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403148; cv=none; b=MBDxfucLy40gT2J4bbakVOFgGRrmUZ/pdyB+vmQlCD8sjyjXul+CkET1Mfmxdo/hu0myUUUxwPUYkXueEp6g3gr+OwnAqTSOfkqJuQwdcSESusbgSQ5RNMhCDLJ/sUIXmjxaVXc4ng5aBmI49wKV0Txg1sHneouHgmr0EvNJoYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403148; c=relaxed/simple;
	bh=nMrzAHRYbaM0CPzFYJoIrikgtExLbpIG/tDhr8hm/0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7qb4E79Qro39DXK/OkjQi42/bdDRPu1q466jllc+7l7+06LkrW/ugpxnx66+njKAS37YzbZDxTiPUBVH0sBBf0LUj18KWqu1AMzzFgcuF1pEt5vmZUQrbd8359O86fHvO3d3cKbCFXr94Jx+pVghDaSVbjIYe+ehOlvwHedtw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vXIUpGYE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vXIUpGYE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b8d483a08so2700639e87.1
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403145; x=1718007945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvxlVn3WbqZZhkrp7NY7W//mMZJXucYwAeoohXFNboM=;
        b=vXIUpGYE/Mjh/HeE5QslExAMtjVNMvO5n51uUBAr6VxDNtdBs062NinJKsoJkGMwrl
         GxArki8dBJBtt6BpYqRx3eMfDmHOXec0IxYjY7YC1vyaKKLHiu7h2t5x/dSLS6G92xM8
         /MpNv2/zpiisVjuQlcw9dj0Z/BDBI95zBCAtI2NAkUu7Zwz5RIPKGkEfvFnibFDm2/3e
         xfOFrGQbswQZTmHz8nxXK2LYkKDQcNUunW5wHP0r7Q2aatLL6ze5hp+umnNlSzxvv30f
         RBH93Fg+o3d7y3EMrSgn3N7MKLg3dSCoCkBZi0axLMx5rUctbkZ8lp7OALGLKLqbFUUH
         iwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403145; x=1718007945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvxlVn3WbqZZhkrp7NY7W//mMZJXucYwAeoohXFNboM=;
        b=IA3+XHRSgOh2wpZ9hvFOk5gKzrMrh/w9FP0lEUhR4agkRQA69/gtvoTucyi/5WAQW6
         xvQT2UIDEWJx/e79XUEJ012aNiGOAsDeYW6ay0UCo3e5q4QLJMp6U6iwjXUugbmJuK85
         sZo0bXcEjNr52zN5VdwibuBSrw3iyfEd4gSy5zzYzACzTX2sGL5/ANOgx6f6Fz5O+d5Z
         TwugDwlHWW6Fiz2pgOgZuKnBDe8QHztbotfohbSG4aD9UIhH67G8+IMW84NyNoaF/ype
         pv95OVY7aGJMGCdzObOQHVgZ17tIh+xgOYsuI+Pn1n0rFjzgHDeNLd55T7TE85niO9tu
         MWoA==
X-Forwarded-Encrypted: i=1; AJvYcCXoqcl5R2ursbfEWFjhXEBCsUt77sKvyC0sUF/I0wGl39IhTQBEuyBSFVEYuVftKZAWptVfF/uhY9esPHmDQt0NM50s
X-Gm-Message-State: AOJu0YzKUdy86LTyGkdLKdEW5bOVlSf11jGteyTzRMW1rYD/RiznRWIp
	s5MoToVIP6xw1VqIZndjh6zDJDOaOqyXTfWNIE/nZa7+r1ANfXE2tUUTSrmQYIE=
X-Google-Smtp-Source: AGHT+IHvhGIL9bagwIEIWKklEMO2niJwNdydUNxk7jfjMiblsReyAbr8xDnjx9dhW5olJB7JFIJNmA==
X-Received: by 2002:a05:6512:158c:b0:52b:98ab:6100 with SMTP id 2adb3069b0e04-52b98ab619dmr2154272e87.15.1717403144788;
        Mon, 03 Jun 2024 01:25:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b84be78sm108641565e9.17.2024.06.03.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:25:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: alexander.stein@ew.tq-group.com,
	krzk+dt@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
Date: Mon,  3 Jun 2024 10:25:43 +0200
Message-ID: <171740314108.11298.15004161310238771393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531164357.1419858-1-Frank.Li@nxp.com>
References: <20240531164357.1419858-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 31 May 2024 12:43:57 -0400, Frank Li wrote:
> Convert binding doc from txt to yaml.
> 
> Remove redundated "gpio1: gpio@2300000" example.
> Add gpio-controller at example "gpio@1100".
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
      commit: 77e1ea9e9913df8c23ac102c9c2b7c49a5d224da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
