Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F925166F3D
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187053; cv=none; b=UnuBPQLkhUiJN1vl3l8aSLyyN+S/rUxbxD20duInPkN0WdHl17TKjnIIq0vSwofAlojqVzB+h0MpQndEuzEYnfNWq+bAABGXXzIIyl/7Gct1tzFK6Rbi24gwAzOjvV1aXt+ucD3GKY3LZc99/xC40/ihVuHIFsGCNzF3MhYJRY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187053; c=relaxed/simple;
	bh=k11OP5u/elxZ0IA3f/1NYT9goIr7RV2h6enL68n0g1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnkC4XaM8IowjRLSRXDYMudt8t8crVKpZZxQLLYzL5ip9bWP+ALeKBM8xs/UuXDt64KSQpxSLAxvqF3yH1LRQGYTABWHpYp5Sanb1xfPDgVcRs6ic/yZ/IpJmgYX9AfF7p0iBrxNBp3ru8SyH6CAdCPy611edeC1EdvXW8gQAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzfJdxkQ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzfJdxkQ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso70020881fa.2
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 13:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724187050; x=1724791850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HVhwr7mEFbHuc5+PITNpHPRJTBdthKzTVoQ68u4vyc=;
        b=EzfJdxkQXx6fez/Xci5MA6XVQY9ot0w4k2a1oQlKDEedYrAvQESHM+y55TIrX0+FZP
         EWlyu/2rugBqMrLnVhPtyjB0hcAUdke4nM20nlAdfz+iJbodJb+s6Z+mhAt9fuPF/BZ/
         MrW46H3u1doGovns7se7kP1upKruNZubVIHCfhMQhLjq9uD9CVtQe4pT6Hz79q8a7ZrH
         IXAGMDqkRfkxuMdtJT7+oAFJQZAS7QkSXlj2YLxv+pjJstng2kUvbJyRlXpbwhu7ksOm
         1uY0CcgZG1EaopDeBkpC+U5QR0XXt5HZzgWPh5yg9pSiA0LkIs6qjkylfDTHHUfrOEIj
         mk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724187050; x=1724791850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HVhwr7mEFbHuc5+PITNpHPRJTBdthKzTVoQ68u4vyc=;
        b=Ezc3h0Rh0HuXdaooZOPDf8/CjKFW4tLy1SsPqwfJbYEhgfLta0tqB4COxq74p+ZZOM
         4i3ieDQYhNSCrBHXA6d/3uFJgFeJdulNEawTmcNJ57PZWygGTUUFQBQArxRw+mf88df5
         N98+oudn5yRzIHBFjEEkcxX5YFzp4pP/UeMlN+2Dq18EMKKGrhGL2kOPQu6USvmDBLxE
         sscYJxhQaLQckvTJw+peBcI6lK2b716YHChQm2X75ZQDc+tILIYR+wlKXkn+NYk5j0lb
         WoOv5V14+BXf8UlH93fctgI+Nq0waRz1wbHE6fNviYeE3uHOpkgdVvhXwfFSYA5iHqHL
         s5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2wFS992n3zBVdf+ya3jMGNs66k4akHOpIl3+gTaJX3JiIF051JvuVAsK3L5S4c+3NAKU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq9X/iJLCOhos/+5bwGxL9/HpyZWvZ/OpOnLGXmdodM2/A4Mct
	0pr9w2k35zEbeTW3qEs/Qx9BWAihZ5+IgL0jUcCb/+cpu4xOIdDTLAI1SrMTDBJmnsInBrA3gPu
	nUQB84r5uR9wFkpBw2L/D85SzAoo=
X-Google-Smtp-Source: AGHT+IFEkjOZu/qF/T/2rC55OfZS3WzP2xPs8K0kbhclW4En4T8f/b9hZP+U7XobhMMbhofRmQSFL+XoxCX4mbEp7DU=
X-Received: by 2002:a2e:a4d8:0:b0:2f3:aac3:c29b with SMTP id
 38308e7fff4ca-2f3f881cf68mr949901fa.14.1724187050081; Tue, 20 Aug 2024
 13:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810>
In-Reply-To: <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 17:50:38 -0300
Message-ID: <CAOMZO5DLBUwbXukzVJBZx4iOTAR3seX8m6Wdj+a8u_ixvBwkDA@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 5:45=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> what cause probe failure? I think it should be defer probe if some resour=
ce
> are not ready yet.

The failure happens because i2c-2 is probed after the pca953x driver:

[    1.898258] pca953x 2-0020: probe with driver pca953x failed with error =
-11
[    1.905575] i2c i2c-2: IMX I2C adapter registered

PCA953x tries to write to a register, but the I2C bus is not ready yet.

At which point in the driver I should check for the I2C controller
presence and return -EPROBE_DEFER if it is not ready?

Thanks
