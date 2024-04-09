Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D37EF03
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668496; cv=none; b=qMFd0cMMEnTt/dSrhFHMTRvAtkTsnfYutXEAvMtK/nG9B0JmdtJzg8sDm5hiJEQalS1vO/H/G0aXhKjHmXGBewgDlYO6ugzxbRz/RCqVHGo7m89+bUEIVjeKKno1ge9G6+DvnSbEHo+zHoL5rHt5f/zM3Ig+YzJf1Es0SZlcM7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668496; c=relaxed/simple;
	bh=HkkZ12I8ixZQ/oJnXLHsHJfU+zBdCbiPsKQH0yIAXww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdBo/SnR4qGbueeEk2dB4Krrqs7L9nO8uPQxQPUJrGcBoSpoR/TC2631iBgp/6hYfYQFco7XhlXwU8OW5WcfnehdzZOLeCHhyy2KWUElgpQ0vvof0zwuof6B96iUnQcG0hjCyOOq+D82oQlFFuoNz66oRzomY5QFtoOS65UYYBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2yecTju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2yecTju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C58C433C7
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668496;
	bh=HkkZ12I8ixZQ/oJnXLHsHJfU+zBdCbiPsKQH0yIAXww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k2yecTjuUO4NFZK3I+/0vQR20NSltBLSvdaVVahQNmcC2hXy+z/YEVjPtB8wukTtF
	 RNBTgRxl1f+S4MyO6mO4Ohug1+muDJ8rJ+HYqcCvYOmYQQ9uEvEScZfSytM/fl1HaY
	 v0WNPtrQJA0t5dOgXu1lepBXIUnjDJ1ENQ98y2X9p8PYe/Y4T7Q+ZfpnIG0AEk1z+O
	 NtlWBITakVkFg7zgbtsLqADU/JY9oiRigVBk3M51esK9Lh60trs0wNPnKqfB3Dk3Zt
	 T7uJh+8/A7/ZikpZTg8T7YiNH8GOijt497C858TXC6LyecuO1KLN7CYqXMEOwHSvLc
	 4GHMnVHrGv4hg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso6463794e87.2
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 06:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxFzB2pj5tcN1RtphPMzxU7f1yaPVnAdiOcz6Y2OkArgovC+I6nmIYKJNVpxMmniZrrv/o1n78eU0hdeCxvi8MAAIA
X-Gm-Message-State: AOJu0Yx6af18bZAEmSV4D+JAJsMhfV0FM+hQuQnaDS5vnYyAU5h9/AZt
	YDgImTD2MUCN2/tU1EmOrpQjy6V1XXRgRPL9JfW1Ifd0YqT39o3XHy77fH1NnulsK7VvGMlrl1X
	wutssKhCfCMeSyESplYOwXL9dWg==
X-Google-Smtp-Source: AGHT+IFBrxuzqDzZhJGZkUFzxWb6IVnvczlBrbogUAcIexbXYb4PJb6Yp8VQzRvCcDRYhvgi+lQjwy/IEz49V9s6uG4=
X-Received: by 2002:ac2:5453:0:b0:515:d038:5548 with SMTP id
 d19-20020ac25453000000b00515d0385548mr8080039lfn.31.1712668494427; Tue, 09
 Apr 2024 06:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com> <20240409053704.428336-2-saravanak@google.com>
In-Reply-To: <20240409053704.428336-2-saravanak@google.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Apr 2024 08:14:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK3vrd6jE07LAnaShf+Rj54b9DHEY4GVsmD3dPiHYp+tg@mail.gmail.com>
Message-ID: <CAL_JsqK3vrd6jE07LAnaShf+Rj54b9DHEY4GVsmD3dPiHYp+tg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] Revert "treewide: Fix probing of devices in DT overlays"
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 12:37=E2=80=AFAM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.

Please say *why* we are reverting. And you still need a S-o-b.

And you are missing some maintainers.

Rob
