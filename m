Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924734;
	b=N66wFO6YUpDUNVigUjp+F8ewkrkIVp63oEaMQHR8DcxVRh+7EOzDQsMio1udTEKshYY1
	 WedQcppIYXgO7nzOaGLPQmhsp8R7S45BUEsxgCi1GJy714glLAb3lns5ycTs1wq65ue89
	 50t3brUKJpDAcgi57Mie2IBxhPCVOLqbtRicojWC1mAoqPSFC5hkF/X28F9C8klkCoPPv
	 UJh49XLV/fBxWWNaCbKeKEUrmvjblLYd673TnkwjcdGaxwINRIhmDX9ufo3Bux7+Hqrcv
	 AywEdHvlWeUEij+stj0AiORu9SszSBFNjho7elHO119wzKO5fZNVbtifSz+1xgmGKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924734;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pbNZwpO0WLPO2bSO9M9Tgbqe1kctlVysNw7KKHUQxRw=;
	b=4zufY6DTWrtbPVsgFUEIsy/1jcs0efxcTu3MfVthkHRekjFeUPdRMUITayD9bw26exQv
	 F0EeRMQ3VgL4XLKyyZMA5elK9+ZIWlOXDCPphTcKCxdvqhzcAn20MvVmsv6FWeQHA55yp
	 hgyrVK0pVMPpHYAGXcnVEV/mP20TC2YB6OoBGT34bI9t4uXmPl4nkhRwijssxa1ytsV3F
	 O2Aw/rtjgWsocaLPNciFMficFZhKuorrDHu5dXA6dh+MbWeCUqEuMzdnk2uO9dwFxQ9wb
	 gj8YXn4YrXqZEGEoLaWF8Y6OUAJ0Rwh9Kphfj7Tn8K3ncbbk/jckNd476qtqS+0DFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImjEFfLZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF6606A333
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImjEFfLZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346141F000CA
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924734;
	bh=pbNZwpO0WLPO2bSO9M9Tgbqe1kctlVysNw7KKHUQxRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ImjEFfLZ4ReySMJg6pyyhW4kKzRBBH5I3lV4fAvOH2xoPnphth9aE3oCDev/Mk/8o
	 Mdd7BwPAy/wogycRUXV5a05uRTiy++pkJUd2uN4afFORFy0rbWWiLenYwF4vYQvTvn
	 z+SkPAIuPte2ZPVGu1CZW8f3JmpxlmSpAkFej67kIE9GOAvlgNmtPiUCLbeZeSmZdP
	 +kTuRQpOi2chjAnWIxqZmO7Q+Ph89DSjbzCkd8mFZdZKneWjjx/keF2StoFnSbfHTH
	 7OPbjBQcWX7esrUoAR18yiBd9A8Xtl310V1X3xWFDaAMSKeH/q68l6x2/HWKTNdfJ7
	 bVv2YjTzcl+aw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1056904e87.3
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 06:12:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHenC/vb1McSsmOEt1yb+yhGGYqNzbE7/m662UOBZZsIUpzDIM00JOW+S4W4ZBHCpcQLBo=@lists.linux.dev
X-Gm-Message-State: APuU4Z87KvwI7Zp9G7CRhnusJGaFqW+2PQK6QgOBYeMWDiKypIeb0O+v
	l8GoTmBJJXSkPCkdu3xjbon/4SCBNFqRPfGZRanI5mcLgvZM9pMhtYEXpdLCXddaVOdA5Ghbn9K
	qk/2YMVHWmiRWjzJJVVqeDXygCMwjCnY=
X-Received: by 2002:a05:6512:3182:b0:5c1:5a23:ec04 with SMTP id
 2adb3069b0e04-5c1709a86d0mr5207689e87.44.1794924732930; Tue, 17 Nov 2026
 06:12:12 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>
In-Reply-To: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:12:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=eaNy+JxLEbFQ52JPmTAE-_-jHmHzJzgUgUaqwtOOoGg@mail.gmail.com>
X-Gm-Features: Aa3M54oZqHQKMZF59PzOU07B0U5kws7VjBYGwpelj8tlWXe9U6F2b0839kFN2Uk
Message-ID: <CAD++jL=eaNy+JxLEbFQ52JPmTAE-_-jHmHzJzgUgUaqwtOOoGg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: widen the packed config
 argument to unsigned long
To: Peng Fan <peng.fan@linux.dev>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:28=E2=80=AFPM Peng Fan <peng.fan@linux.dev> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The packed pin configuration stores the parameter in the lower 8 bits and
> the argument in the remaining bits of an unsigned long. However, the
> argument was limited to 24 bits: pinconf_to_config_argument() masked it
> with 0xffffff, and pinconf_to_config_packed() took a u32 argument, so eve=
n
> on 64-bit systems the left shift in PIN_CONF_PACKED() discarded the upper
> bits. For example, the pad configuration value 0x1080000 used by a new
> i.MX SoC was packed as 0x08000000 and read back as 0x80000.
>
> Allow the argument to use the full width of unsigned long so that such
> values survive the pack/unpack round trip. Cast the argument in
> PIN_CONF_PACKED() to unsigned long to keep direct users of the macro
> consistent with pinconf_to_config_packed(), and print the full argument
> in the debugfs dumps.
>
> The packed argument only has BITS_PER_LONG - 8 bits available, so on
> 32-bit systems values above 0xffffff still cannot be represented. Reject
> such firmware properties instead of silently truncating them.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Allright patch applied for v7.5 let's smoke it out in linux-next
and see if everything survives!

Yours,
Linus Walleij
