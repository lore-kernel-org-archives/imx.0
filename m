Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D79381C4
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719868106; cv=none; b=f64UX6N5lDTVSGruaQ3+Hfny2nBpIr0XD62LgSsAY0PJN1zOvyhwWE68G50wKKGrEjKXGvB7e/xGM98Gw+PtlUO4iklW4ZMJFmALDYax0LryzxzmmiUTYfgjpR7IYAy2R+nNDcRLAGqdeXSlqg18Rk+6uRoK6a7bUKzeT4yEB+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719868106; c=relaxed/simple;
	bh=8Zg+wlgvAADR7KQVVOswBUJlKgkjNKmpMszyFdT87m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVaPs06Q1c2182c/k6TnnqGnKyh0q5WLWJR7zU7PFEF9Sfc8TQylR4ZYwWJkSefBohOAWxiaaDIbjfTwt2A4HPxVHz9wISnHSgjSSS/efoiPckwPCyjMxp2s2KCsmhjzkvi5/VH3svFiKMN1CoFKnCbIAskOVWpFPr4XEhHfPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndbbDa5Y; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndbbDa5Y"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee75d91d74so14441fa.0
        for <imx@lists.linux.dev>; Mon, 01 Jul 2024 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719868103; x=1720472903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Zg+wlgvAADR7KQVVOswBUJlKgkjNKmpMszyFdT87m8=;
        b=ndbbDa5YZ6EyuNYZ8KccaZHqeaq8mojkLqTYGbcpgkToSI0bw6yrmZRIInYF/i8WUx
         eXyluaqqIMWIJViSiv1vFhqpUPDmnarVtXNpSJ8Wj1bxSQs4bMhtS/KXmlxVSSh/EYHZ
         2OVzL9czOrCa8iIH48tN0DHCTfqNP5sbveIpUzv/iVbhvG+ICuIP8zRvus+L7fvmo0Ls
         LSwklmFZ62kcLLq5us7AwAJMV7/g4i9NYUejenniHa5kAYEErDYIQcFny3YIjqv8cOli
         o0lCaN5V/tj5ltd0jSDicT2GFL5Eolqns27DeJsQqBVgq0GUiKw+5pC9gTcB9C9rRFLn
         03uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719868103; x=1720472903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Zg+wlgvAADR7KQVVOswBUJlKgkjNKmpMszyFdT87m8=;
        b=VLJ0p6KbIBtX6Yfr1DO9QICoLzqicPjO3b992ELQs2m74Q213f8kGfaQANUTctiaHs
         1YPqBpx1HT05JRRMOgQIoxl2fiNHD8avBhJeSjW6Qq9LyVZfTa+bQ2zDp/fIyd0NFzno
         aveuKiaSFqlJnMtZ7JG+5WqZ80iS9lqcjSbSBjqR+ocsPDC0i613JdeYCMq9SEWr70H5
         JZ9I73tTOS5hqaP1BgvnMVCQK/dSbyMiHrrU9CRiy6qENkS6EZ4+S1qh4tz2HcbwFwqG
         aBWNgE6o2QTUew6oFtJ8hJRL4SSqBK4XcjgKq6W6pVMaG00ci55IsHtkcsYRQBVZK5rR
         x7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUqi+GCxXB2MoqFNMKJZ/2YwACyHB9+kiDsl8cQVB3OMZwhfso3UqJJG9dTvNQqDmhoKE2b6qgBy0ot0DIB18SdkREM
X-Gm-Message-State: AOJu0YwmJ7rIo420t5j2A+DUmNNYPIREd0i4lqgfvVQT9bkhQafZwBDB
	GLrX4kUB9ZaEQMU5fDzPTMgSZC5KYTLV9jf+F+bVGZr+8J5zpVX/jh0Gnyih54zP7/9Ft6O7el9
	SY+Ifag9xz82dr4h8yjolE7OO90I=
X-Google-Smtp-Source: AGHT+IHJv+oPAf6JvaPjaNkLp5qGp4JhBt1bSFmAVSHpVVK621NLpVVPq7w6X1NUFHzeekPKYhtpv6YQfNnML1RajbU=
X-Received: by 2002:a2e:a16b:0:b0:2ec:4399:9bfc with SMTP id
 38308e7fff4ca-2ee5e2a6afamr35728631fa.0.1719868103049; Mon, 01 Jul 2024
 14:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701205458.164053-1-festevam@gmail.com> <ZoMZ1QTNyTNmh7p/@lizhi-Precision-Tower-5810>
In-Reply-To: <ZoMZ1QTNyTNmh7p/@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 1 Jul 2024 18:08:11 -0300
Message-ID: <CAOMZO5C7qUOSqmjZMgx5=zZD6PapcU9Jgmigw4CAveAtkx-YVQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Remove 'snps,rx-sched-sp'
To: Frank Li <Frank.li@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 6:04=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> No sure why Krzysztof NACK a similar patch

If I understood correctly, he did not provide a Reviewed-by tag on that pat=
ch.
