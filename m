Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BA211A09
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367780; cv=none; b=Kjdu81dqtcXRtk0uC+IvAmh0ru/nBLfWnyjmAPo1qVsoMFCSf0xzZO2GcxhI/CYsgpUu1gcWugEco+D4kG+hoE7wdiFHxEU8dOPPxx17/PNSi4jI8HlSmNgDyw1e9sa2L80CJwduZB+JBQEwuo7bNchYhGMBgWUdYI3Byw7DlLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367780; c=relaxed/simple;
	bh=Kw6DgNTDjJ7Trh38aLjU5+eLyuRV6tLCyWZnLl0+K0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1Nf2Ks94BBiCb9kULybKSH7crRskMeBhRWFZSvkzVhhkbrM3t6ZOByno99LVg9lZe8YeGuNriWAiBYdTioUEPXdZKpAKiaYo0HPHo+XPP1enU1jaWu/FjvIzHO58PQ12L08RVDhTahejR3cC+6OLAlCu27piokMFaxbP7ojZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfQX04Og; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfQX04Og"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1154619f8f.3
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786367777; x=1786972577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kw6DgNTDjJ7Trh38aLjU5+eLyuRV6tLCyWZnLl0+K0I=;
        b=QfQX04OgUbqaQeAwFva2hcFsXPCY9A8CYQPr4/TDWaBQ2VSpIIFj2Ptd+fvk+5r7qT
         w/DQod0uYvaeDZ1vrWSfDmSvTlXxgYZCBb8p97U7oRwrq8lsBzp+F31kIFs5K9EMVBpe
         G3Uv0MvSWUBaOQgVSwTpWZHpHexvKLvtxZpiqOKEito+YQ3BGNarkkOjXHCimfy+spML
         iLE3WOfPj54LeUlJ91xbZ7j72bvKwOmHHnU//Wza+Ld6v7hAsTkSTCPjfolg00t1bMHh
         8Pt2ycHDjiHrOz3LExTEn7n6BO3C1bbGetIonZRDS0gxE4Bx1Vl4LUDC/DSEvJoi4ari
         2JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367777; x=1786972577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kw6DgNTDjJ7Trh38aLjU5+eLyuRV6tLCyWZnLl0+K0I=;
        b=mYMvVuLXp7W6nGeWwrTQmzY0vgA/bnpBVNWhSPb+w6Pq9c8HgHRv99kflE5QtLBX6i
         GPb9ZOK82TDmfPQLCspVZKFjPe6tgX78qlNtItOxjEHCecfUh03bGo6NAWjHrbNCBP7I
         oqB0+uSRuwWT3qSsCfG8Zplagc0MIg3WftSxpI8oA2OCKNDe9bn16qUaiJGMiMXHexbW
         qkahFr0KxxZEA8D6ZckwcDe7HZr6566RLym6CXnEed7oyA0AgbMrTqkFRv2tg3mHnwqo
         647eHsr2xs6AUkuL4/AdkhjGdx1bcVZILqwy/PL/JFPERB8E17atM+HmVR0tgcOd4iKq
         G2gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgURLZq4JyWHynPBXoeKuCdF5sAnoZ7KVhgmhVqau9ZwFRmqSksF7t3Z2JemSJn+BTqwM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiIfZbG0oXO3YG0hWZeGAHrnbwXIX3CM/CHESfQcDacgJ68pu+
	ut/nT68UbG1hun86izql9urf5GFAfOd/pYBwvHBM2ktNK6JF3LzPUpfz
X-Gm-Gg: AR+sD13hXfiMPJQtk7a+YQAoW3NAZ2vFTICt7tmTkY8fMrKEGu7TsHWAK8xevLau1p7
	mIP4epPn7X1p4GZgq1PPizJ7oUxX7ArTexFryUyqOQX544TQbXFckqNzTDw6/ZAbDTMVwTj3QPz
	yokAXbaOB4GM02UlYnc2Lf4+lF1P0TEex2BAw8JxMusneTDBLNXTzre0dkyzkCJcswUxbA5e2Df
	OLJNzdAJ4rqS89YcoPkz40ZSUSC3xpriv5iIvRqZLEk2/A90vWbNedwSSF5tEhvAWOmaNrHb6te
	BC9dGNGX1EMRvGYhTsJMuK3DnxfGpZyQHv4Gz+twO+AxEHKvvNwrTdlEquKpEfOF91Z4iJgfE97
	cERYXqRAw+Gm7+hbvSfbSCpEJilJdMWFIiPcY7bUq97s9NTGOMpjZrBZcZR0AAJR7FkyXlxixLp
	XeynNuGPhMPlwu9pHpe9tMaNCRKRDh6VvVDhkggo2QtqDQieAQxzMXSlBAN7BHOfxPxUL6ayR9y
	XNq9r0=
X-Received: by 2002:a05:6000:608:b0:47f:9662:85fe with SMTP id ffacd0b85a97d-480026c8757mr32089392f8f.16.1786367773907;
        Mon, 10 Aug 2026 06:16:13 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm32740180f8f.2.2026.08.10.06.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:16:13 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: stable@vger.kernel.org
Cc: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	netdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.18.y] net: fec: do not release NULL pages when RX buffer allocation fails
Date: Mon, 10 Aug 2026 15:16:12 +0200
Message-ID: <20260810131612.2637858-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810123902.2611897-1-mehmet.fide@gmail.com>
References: <20260810123902.2611897-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A note on the trees this applies to, since the subject names only 6.18.y.

The loop this patch fixes has been unchanged since 95698ff6177b ("net: fec:
using page pool to manage RX buffers") in v6.1, so every stable tree from
6.1.y onwards carries it. I checked 6.12.y in particular: the code there is
byte identical to 6.18.y, so the patch applies without any change, and the
crash is reachable on the same terms.

Please take it into whichever of those trees you consider appropriate, not
6.18.y alone. I only tagged 6.18.y because that is the tree I reproduced and
tested it on.

Thanks,
Mehmet
