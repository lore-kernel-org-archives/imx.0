Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EBF253F32
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945667; cv=none; b=k/nP5dBb9tptpoQYlJfYvnNEeGevoQkRXzEscSC9FB75wnUO8dHAMIZGHMm3RTf7GreEB62TIlsEigPKTA7sd6p0X7V3PSL2SOT4YIvw82WwJAvYlXpNgTSnfuqTbSIABmkcibTyQR/oBkL8gM3jNa9JPRMZOxeehPKhxt++Sl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945667; c=relaxed/simple;
	bh=AdoYyKISP36xJeQD9woyN2YEZghocYxvykppZ9AflqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnrjXnkE2Xht7/dUamZSRn7zzXZCarFmDnjo/hSZImSG2EnAHQpfzhmCnbWCu1Ff+kxXI+yXWH2xhTceIZeq5dPIunwpMY87C4vzk7D33d1eVhoJA8q0PdMb5hhH4ECmvItrh/LtFfBWDg576qkAGiF3ODbhHWZTSOrGFgZMbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMCcA1od; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMCcA1od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C996C4CEEF
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945666;
	bh=AdoYyKISP36xJeQD9woyN2YEZghocYxvykppZ9AflqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMCcA1ody40ilGXC0Qybb7DD6sqJxB52dAXTz8M0wbK6IB+bf8EDHo+zzXnykV1B2
	 ZI1MDHferuz/WYILmf64MfVy+QwDtMwoK9hJu5FENIHEjcHPdsmJr8V+2NcyUZWQR/
	 Zdf6orSEajxT7dZqQA6CDJXGCy0o17kNrAxtAudher8AP/WyxvfA6LVxGJvT4OZ6pS
	 0bIxAIDtB15QnFrdc3oEUAdhVzZGoHIszrH1ZT2KmV1CIzLZA5KlnpXlD58F78ji4B
	 Ov8zQU6zZvoTI9gS8fwNBEguGszOBuHXgZ+V74f8H1IwxjKGkr04VtKNjQAL2PJNdg
	 FAAdjY9cCvHBQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1117676366b.1
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 09:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3sux9CN7w1EVEmyaEq95krS2Ajq8vciB2DgBACSNnjoE4WXXqXY1qOma69Czgh+MW+hY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjAhoEyeUdjOOjSIy/O2fZb+n/8zHEIHr74fJ8i25ZfU75udFb
	ist/JEkWXt4pWOLhhTz5qP/TLaQj3g4Z5i60XNEmPyLxYTX5Nzvis7tdx4/X5f8nCtSqy0QXn0h
	mw4lW6OCeXNlntG1nDYZSx2xtPoA=
X-Google-Smtp-Source: AGHT+IG7skFkYmrh78r3PBufunbwFhCyH6bMAAQyF6iwtL4SiSNbNImHJcW3bMTneYB2TP8fzRb2vISMbXZRWbUX/Vo=
X-Received: by 2002:a17:907:3d0d:b0:ac7:eb12:dc69 with SMTP id
 a640c23a62f3a-acedc6226e0mr11217966b.28.1745945665026; Tue, 29 Apr 2025
 09:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250428105657.3283130-1-wei.fang@nxp.com> <20250428105657.3283130-6-wei.fang@nxp.com>
In-Reply-To: <20250428105657.3283130-6-wei.fang@nxp.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 29 Apr 2025 11:53:47 -0500
X-Gmail-Original-Message-ID: <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
X-Gm-Features: ATxdqUH2vDIYWUftzeH4CwoDWqiZzAE9yKFOOu8ghijiqo79WRaU9jaZG_afqrM
Message-ID: <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
Subject: Re: [PATCH v6 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 6:19=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
> +void enetc_remove_debugfs(struct enetc_si *si)
> +{
> +       debugfs_remove_recursive(si->debugfs_root);

You can just call debugfs_remove() here.  debugfs_remove_recursive()
is deprecated:

void debugfs_remove(struct dentry *dentry);
#define debugfs_remove_recursive debugfs_remove
