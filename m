Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A63D549
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710161025; cv=none; b=k0aw0jtNUWWdHZIZzBO0hDuB30y/n00K9uoeIwwCzRHav6a9UPBjzb7DV5jpEDROvGQ2PP0W0V+Jv1PHrBFfPHCxNLrK6keGwuTOXP2c2JL1SraLHFJ4vnc+gtJ5u8OJY+TxExSkWdv4mFHSEFMmGQE99e9a6BW0ZPmwequvsuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710161025; c=relaxed/simple;
	bh=7rkxVfWdjgxeUXlDYAl4GqDBKvIzQvzh/NeCtvyEiWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Upx8Y6ePfP+T9tpBMQRkPHydJQSDrHyUeW1Yho6yzfkYP6PZZEoIRFWwiNFNMGv0TwmRSEng1Zae4UeUqz71lJZ8GwU0g9lMwlvKh+b83qPWlQwbpz0ibUXyOe7uXnw/EXFhwtA3LI/vO+Wofo7uMFwfcRxj19JRRdYw7SAyAp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mt7yRH3v; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mt7yRH3v"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e696233f44so78798b3a.0
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710161023; x=1710765823; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+eKmG5DRWeq8jWjrfLnT4GR8dOlHkf0y/wIX9CpqgU=;
        b=Mt7yRH3vVUOFvd3aDV+gkBe+1d2bHI252IqYq8tG32QQQTJyK+SU+Lon3Ww3ay6Boy
         Hrq+p9TsCvfa0c0FZ5JuiQsfHS15OrGQY6MYpSq0kcN+eAwK4KT4sTRnlk+RjNxeLeIt
         pLNRBFaJkgph1JtjDrVtXx7CgI+3U6ewfi51MUjLqd1mQNlLpyx5CUIqeoGHPmDO7oSG
         TCMRdnZMbCcp+YhqaSeYdWsrypwHyCoZ9IfL83U8APx8tFTnEj8tcyVfyicjLhSHi5Rt
         maQK3TH3SzKuJo2na2nSnh//FXc0fhZvOc9PX5BaU1/OtlDySWPetbh3XLpTVgqnG82B
         RVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710161023; x=1710765823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+eKmG5DRWeq8jWjrfLnT4GR8dOlHkf0y/wIX9CpqgU=;
        b=Dl4t85EuPsKqcT7EKE3qnbFiizO0QTupiq0tgBdGVMfNnt/nqTNi6wjqGWQlKr1COH
         JapfquNuitoz8eQrbB/jy65lxriAuwPDboFI/LPGAG65OE3k9giItYHnCc6V++Yai1k1
         iX5gqqS3aZVMloyjg+9d/+afntIZpMjJ+fG0UHdXQ7cgonlF46rd1owuDt4crtK3JIyt
         uoQKiDvXsnf466r7XqVapknHxLr9/gxsh1FZhoSh601VSNZsqHmjv7TNLsFd8iP8KuCu
         IcjmAugs/RqIpo79fiRjAXAUSFZznRtofGDegzeey9NmD8OUDLOO9WEuVVrmyaQjLXpz
         4kLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAFwU65sp7cfiBIzcynBa3xFH9D4sZl3N8UAE87iUIquZy9lptO/cxDlbvndZ9fIEeVSnU2cHmXqb5qK3fkPle01oG
X-Gm-Message-State: AOJu0YyR9rcbcNuPA8UvGMeWDV+ND7wCW66B8LeluZu/bMvlAd3GXLrT
	tcrVbDTdfG/Onqspl6l/jB9ivKjzaDvwNJA8jEfhv/a5L3mDd67e0YUkm4ZR4Bll5nRI2A/J0eJ
	NnDeatMElaPAOdJKyxjoNJW+/6Bc=
X-Google-Smtp-Source: AGHT+IGELvIZKO/o+82ukdl6Bain1axvAR43a4fG9E+vEyKQOeZMQ2KPK/HHkku1vDElCvf6wbHLc1esaxIl4xs1t2w=
X-Received: by 2002:a05:6a20:9f04:b0:1a1:42db:9c5a with SMTP id
 mk4-20020a056a209f0400b001a142db9c5amr10364781pzb.6.1710161023346; Mon, 11
 Mar 2024 05:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311113201.664252-1-joy.zou@nxp.com> <20240311113201.664252-4-joy.zou@nxp.com>
In-Reply-To: <20240311113201.664252-4-joy.zou@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Mar 2024 09:43:31 -0300
Message-ID: <CAOMZO5A_5mUgEL6MvO=D1RS9aT-DFc8eGiF7VDCZqeSkYtGYcQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: imx93-11x11-evk: add pca9451a support
To: Joy Zou <joy.zou@nxp.com>
Cc: ping.bai@nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	linux-imx@nxp.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 8:24=E2=80=AFAM Joy Zou <joy.zou@nxp.com> wrote:

>         /* need to config the SION for data and cmd pad, refer to ERR0520=
21 */

Please remove this comment. The SION bit is set for I2C pins.

Also, this erratum affects uSDHC according to:
https://www.spinics.net/lists/devicetree/msg641846.html
