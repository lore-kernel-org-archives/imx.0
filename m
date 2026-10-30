Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370779;
	b=VzafWPDtO6AshNWRrefCU0Vy4p7rb2njGGFE3upzueHpIjPsv2pAq+GtBowMv4XtABGQ
	 l7wSzfsXFxwfAoQSckWJ4jzVAhf1C2vTTVUnfhtQi4X2OxHGvf5EkSx+yCR1ATmRranlZ
	 5Frdwl/Mu0ibzmrbm1Ge7Z3HO4sRV1cTsV01i5Z4c59rXar/mRR+UOcAEKK8dugiGg7cg
	 o/X1C3Kq8pZynY9W/3H+fEjx8VtPg8gUw7+XZQMBY0kxyXChEo0Fvu+ny8hBxLj+zDjDp
	 /v3o35HlkHfxcPA/LK2ZsXeI2NyX0uxZvBrt94fOWSQUa/D8GCUqgPcmGgaYkzg2Tqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=XhjRSMM830VxRDJ3aVNi2D99t2MsRWH5TE9WUdAbhC4=;
	b=ehivV0pkDNo0S5M8ESeZQHoz7pnDFHno1ck9rAGLH1k4E58VKLtzJTU3Q91GMWiKlZeJ
	 /BWYR5Zi9DMVeJgj1797kDposgRYr0BBA34VW4skXKGrcURRxbaw9c3U4I5NSWs70exbv
	 yjHLFGPlG1mdMoUZRyxIsKG1JATmbnaUTElbzxO1HzqH2mjbzw6kDDrS+h4CknyS0UDUj
	 QVNE0KGuweb4VlqKTCcYHFcjDGbWBPN6LBmOQCeDaZYjt0HXfxrQPPrxB4yLSxfA6gtNb
	 5w6mfvvlLYIk1KUPZfZ8WPwoyQebuUAhJkXO7GqmKpMgcOAIkbo0Npi0Z0y9SPa2L1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yB3TGkPs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8813606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8813606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yB3TGkPs
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfc346401aso582605e87.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370777; cv=none;
        d=google.com; s=arc-20260327;
        b=L/BMBLcnRlVt/Z8MTfQawXcqL8oJuJ7I1WcHz3r76uII3CvMn7Ep1RTvgyN9PlUrm9
         fFJKARJW5R1rNb8F3FBhNW+S+gd7oA0NAMEgesuZA879aTa/4nr4izSxYtnQyLfcroE8
         xYs3p6oa/u8mTVM34hOPiJ2s3KtdzLlJKxXMkOAPCshW/7ol6DtBkLLrbl0YierfmBlg
         2hP5R/6ySsW7MW72lknnQDELbFDdbcQoujdpgWTSE7SENsYtdshcnftKAN7Ew6jmw3+f
         k8XJLR/Ntov+NbtDzJRjoz1wnsCLZT0yZC/zJFXN4022iLUDE28mBe3fPoClzUBV/BS/
         gllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhjRSMM830VxRDJ3aVNi2D99t2MsRWH5TE9WUdAbhC4=;
        fh=ZJPm7gJC9iPXSH9s8KDniaqaWijR72f3QxKK/BOHDkA=;
        b=V1PQ8oEn6Ku1ShBdxzT+lZOjPFI8ecJxhYs5Q3dhWsJPkpIDVZt1LUiB63kBBu/i0T
         QtDMIum3Cw1zdgiE3gicTFfvDXXcJ43D9o01ThvWJXPVhqy1gIR6eb7al47kSmqvSxwR
         8S2q/ZKcamAOBZHT9P72+KczM+htsirZH8BvvnW/ETqnoljirXffBcboirBH+S4Q5ieb
         VQu+ywpMB3QTUmgX44ctb6bg0+SV89+TvitH34OcXTvAhNLlsFrskwRY/hlNWduEaRT9
         3p8cUOFsTC7EiQ6SI/XY40g47vm0QhRkM9rRqXgStserBI1fctr0nR3xSApJOLtXt9O2
         5UAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370777; x=1793975577; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhjRSMM830VxRDJ3aVNi2D99t2MsRWH5TE9WUdAbhC4=;
        b=yB3TGkPsvWgLIQxxIVmGlv7fE0pukaxSYLAr4Kz5cNmk61ITYdp8Z2zjJDDmkWYB87
         sNTO12Ai6s0nPQ2c2wrUZEple5JpL1Tqr6SP5toFeMBU4JJmjXts9f7nj332XpLwTsjL
         FxOLAL+NeOVQVY03Y7wirtRh1qH80MNt7QWcJedEq+dPWg/MUG5CTTnECKC4DxNzr+XB
         uKJin6b8Amo4ax0G4OudTPcdfp/YefbslfqW06g2g5Jn0zJC34TpIcu+LFwEWqphgkRQ
         oyiiYQSpC7UJDLXrdoVWHVSZYedeEeEUNfDEMK8jsWIphtW6MUADmt62yO8uWdV7xcGd
         SgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370777; x=1793975577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhjRSMM830VxRDJ3aVNi2D99t2MsRWH5TE9WUdAbhC4=;
        b=OpmgrX+P4Z4f3a98yJEA4qRULy0/36eXaTZxO9N1tqzXTkC+QRCjIiAwLmnUR8DFDD
         wl9FV6VrJ4Lbdo2FLyhQ4goGOBZbXt8oD739DIiWyEEBc+4x9xMVSNYSWJzgbkUqLNcB
         oxfj3QYnWbxjVb1I49Plvw59eZSZYujUgsgyzA0jl9KzO8VPAQKMAmMC+Y0982Qgy7r7
         arCq0DeGRCsDY5SOvoovvfUs6UKCKYNcwF96LLqz+NezcRMduy82awnDmptY6WT0gn36
         +FCU1KDxtZYxiFmGyVUj9CAIW/Yib4kqd6ezi4Ax09T28O/O7sAT2zvoT04csrZ5QtBK
         7TnQ==
X-Gm-Message-State: AFq9FYJVhyUxltzMMW6afjCS43UoVvcs573ARKrf46OdzBwf/vSNdp3D
	Jvb2xgXihI5b6apW4InBOhmLk6wr30L3k9wIeZrQfANcE3NFnE50m0Ebfhgpxt06RwUA27ULIVl
	4VmTu7EfTPtwJl9oBlR12j/ugDNWYKqb9omdo
X-Gm-Gg: AYBFou2CkWThLNo7iH/WgMZxad2AHx43dzeNMG1NeAHdiFGPENA9rK2mF9FjH98ts0Q
	gIqxDkgO/yNuVxOT9AilXyqRCS7unnl4LPk6WvGwHZgRc8qChxZZwmEQr1LDnhzeWNnrSF73vQQ
	5YbbbQCT8fc039ET9KmQiTNW/odr8Pu26DfvJbf3eLgoOZjxkfcbTbL7S1mp5gJ9ybF5EsHH2C6
	LKwuE16MFwoRFVmFHzy1Dj9aRm04evloKo2bzPgudeowRh3jYHwBlR81dIh9lxeJ1/Kn52Y82RH
	X1/OEZptFkhI+KRJjW2CuSMBI357K9GZHwVFdJEb8osdEtq8AyLhDQUbI7CjVTfFhkGk7paAt9w
	pPlYE8qf6wionSh47AQdMR0U5EHWc9xhcPWPiKJy/z/77JnAvd1H1g1UtSfpZmRcfHC0vkXcEni
	wRebnkMCyXKalHBAPt6/neLYHe1A==
X-Received: by 2002:a05:6512:3192:b0:5bf:a678:d527 with SMTP id
 2adb3069b0e04-5bfd9586dc9mr853511e87.41.1793370776968; Fri, 30 Oct 2026
 07:32:56 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
In-Reply-To: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 30 Oct 2026 11:32:45 -0300
X-Gm-Features: AclHuK9S_dl2RAtXGayZuA6zqfWlWafn21Hk8ngFZZMkCqtDMfbV92iW1arYpTo
Message-ID: <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
To: Oliver Smith <osmith@sysmocom.de>
Cc: imx@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Fri, Oct 30, 2026 at 8:48=E2=80=AFAM Oliver Smith <osmith@sysmocom.de> w=
rote:
>
> Hi,
>
> on a SolidRun LX2160A Clearfog CX machine I've upgraded from 6.12.101 to
> 6.12.113 in Debian 13, and with that kernel there is no eth0 after boot.
> When downgrading to 6.12.101, it is there again.
>
> I suspect this is a regression from dts changes in
> arch/arm64/boot/dts/freescale as there were a few for lx2160a:

Run git bisect between 6.12.101 and 6.12.113 to find the exact commit
that caused the regression.
