Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993831;
	b=dnQYoZkRHBqnxd2HN52SgNREaj2eakhp9sqmAbs4ARnrQSHXT/mmvMvnjnkcOcbTXjno
	 hQtziJzG9LFPeNBv3UWFndZtuDGYlNdgeD4j3F7mVv0XHO9xy46duhVPvhgVjWzSBB5zw
	 as/UWMlrAq+imKK4eVoZ5nniCkeLayJWlDV9Mm5ErJqy/gZHY34M6afE+tc/Pk3pWXqNj
	 NPWtrdlgzoRak1CvUlQmP5z3Xu1XM41nSS9mXw/fRyJIMWZPSfWrokZvSY4XEcn0x4E5u
	 CRx0pMn9Nrlo5HkQGDA1a1QUcNIAp3/dG/7Nl6Efsnac9L6/Hwcy+CD1qGIcywU74HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v077dxPdbR6B229Sx3h6EgyHNBd+S9MvYu+3WDhncOM=;
	b=Ajc9D0hiAfy+8Wvg7zv4Dqk56IlBY56tMJcwgtVuKJt5tD0cdy1AEfqOVimhldrLrBcj
	 Cq0amBWK+SI9XXwR+M5pADIPfyWn8X7tg07pQipP8E1xEz8rExyF292ThZyJqLeVyHVf5
	 sdn0oWZ9qM+DlSqHF5kHiuvcxr7WnaTCreWpvLtAX0+Y3WJ85NG8ERPXh1wUe6K7khs8w
	 tUGRQi8QeVUwD5KyA57jUeNqLSBO57vd3mGlybWKpRrkPxRjsemqzmqg0rfsqEeJDJKr7
	 onpTYqyURIthokYKQczwaXeVQZNjENUoU75AD7XvZt6M+pBxi4BYXhgtoIUf4TlQnRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ddVuOiyA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE224606A335
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 19:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE224606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ddVuOiyA
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso345a12.0
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 11:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793993829; cv=none;
        d=google.com; s=arc-20260327;
        b=bmwDfQ7swyKQJRNqPldTAbeMI5LfUHGNhy/A+J648JNf1rdq6JqoY4ke8hteXiL9Yb
         kzNwfksN/qj1AYQHvMTo8G+D44XdCiTNlbHK2xMQT+wx5Vy5S5XrBPRjCyIVPhhDp4bA
         ZMn81hIUBBL2xiOSXsrJxiynRU1nasPAHFmjwAm34mQadSIevrIuil8Xt7bl2PBCyK6B
         L+F6VJ2dAzpVo/tI25MzGVfUviWlZPG2IMci4wTzL44Ns4bq5Y5G6stTdguXt2iMFolH
         Jf3GN5EzzpqtjEH0OD3KRuH1hcf7lLhY2BbaaU8XfO7WUkhtWKh6mDos1TehDWJNUA0n
         QAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v077dxPdbR6B229Sx3h6EgyHNBd+S9MvYu+3WDhncOM=;
        fh=G8ffslQHEarBCml+KZAok8I5G7RhbE8FMTCjOdHTN9Q=;
        b=WnjV6dkZiOp3FjLL8uT73otPiI0B7GQOB9C5YIBtS7QXGFfrj3EdW7jGypBC+/HYZj
         tBudZSA/ynpYEpDPBF1SjGOYsfz5GDolm+DskJ1HwNGOX61q4kLubGPX6dgzgeVWZXrF
         vXJy65xhe3VXMAWfDAGApxlIuQztTgo0BB3ggdJEUSVJn4yjLZTvM+d7HnpHDbYh/SW6
         gNMV5bz7lNJyntf+f0GneGqGrVBvPiLewWOJBMDcYCkGMBANCkgAJYR0FNXjlzqtHy3H
         sZbDEs47gC1621yymonRAiTHwhWnhA1BlauR7z6ickZ++TJHH0ddYFtC79NKc5PVradz
         GoDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993829; x=1794598629; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v077dxPdbR6B229Sx3h6EgyHNBd+S9MvYu+3WDhncOM=;
        b=ddVuOiyAVwsrosrtiSdw861G4QIxMsiAA44yuWUkwJBVgjtWcHZHJIPKOOlJUjh/zn
         XKOP4OvPk9q9R1HEzpA8ms44gci9HcHUsJymkIGw3IJLjoHZ3jIb9ETyqopUeG5ZJwKg
         R8eXaoJUeWjRc1YOsjghUVEd006Op77Iz/KD+IjNs3dgoJYE/7+1Vhom1m1yLiCXuAX9
         eHB+HIjP5GpVguF9CdgNb5YqbKS+GES6O1nHjIUisMQR35DJsUm67Rj5a/6OoaZWWsQW
         7Z+TncRX4jwmgeYKHOoBUxr29bxKxbatOb35EwiaF+XPEiZO7074+wE9bQ1Iyx4pr83L
         uAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993829; x=1794598629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v077dxPdbR6B229Sx3h6EgyHNBd+S9MvYu+3WDhncOM=;
        b=WyCKLQYP1fbAZKZXBfxvD7Jj6au/gLtJZHHrsphYfZc5khxKR/OkSbCz6s22BYwgn9
         9CsdQgug3hB/inLTNOWdqgp6ELpYcqzNjNHjc0vJdBRVea9eNrfqMag+KLmAbfgTOuTY
         s5iR6VkFLuuFNuLSyIgZiZsoYziF5CG/Awx0uUzEIB1EYe7Fk+ufOeFgweXIdqS3QGf9
         r6cuOkdcR7uEQNFGfOthHk+3jNerO2KJzhuVhTRpPuLUXC2JcJhBMQ1gbLgCJdpow+nM
         YDBlx/1VaZN/iJo/TGD/sdI6imUIHwiPhCSM1SD88Z9m5wqUxPGBauJxY8bTOkDpjXxK
         +Wgw==
X-Forwarded-Encrypted: i=1; AL+hErEg+WBmMG87Gb1F4S9xTCH/uIKgXufAQj4hYa7F62ESkqRk/OlPja8UHo9JyDSgaPL7PEY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jgKNA7X6Y/1ZDSQ8M8Knd98j1Opd4fNuRRO4H83t3/EElTcGv
	VBiOpFxlEB0tufXTMffv4YMo6BmrS3F2ykAH/OHHsLvB7IAdQD5vv4Jni34j1ztqUVGlP5PtiLd
	g9CT8EeFj9C4rhsjnGq0xlH1lT50cgG8H0QPe+a6Q
X-Gm-Gg: AYBFou1jtGj+aATQKr3VpQI/r2krhWV76K7Ir/hRKKgiKpOsQX0lwHEubGkeHr/0wr/
	ipt/O4yFnLPMMybSLSQz4SN6MSx3X6zNrbvWucv/+zS3iGu70tyLjmoIs61MABKNy/QbUq+iFnC
	Zvff+g60MD7X7sPZejAkacoxz98c4d05h1M6dmDktxPptNMwQ+OYynelFJvNwTkhJ8V+p0N4atr
	9PPV+7IgVNlMXNg9p0tIqQcfJCFyAsygWn2g2cDdzy+JFFyo7pNvW6Upog4Fv0zK8ZjRBFhfAmE
	hR+Vc2+robi4Cl8uVadjEcocDsnlS9he0gzx1xmpR4qHNsg13GEcPyzNKIY4pIL7BM9ZW9Bwsf9
	YnTYOYrhrMC+3XnZmpDOZLtpJdVQa7tnu0F4HvcuECDgmxYETb+Ozdl6xNrtdk8qN+cM=
X-Received: by 2002:a05:6402:23d0:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b6f845ff3cmr14348a12.15.1793993828178; Fri, 06 Nov 2026
 11:37:08 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103211424.127627-1-almasrymina@google.com>
 <20261103211424.127627-5-almasrymina@google.com> <sashiko-outbox-198073@kernel.org>
In-Reply-To: <sashiko-outbox-198073@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 6 Nov 2026 11:36:56 -0800
X-Gm-Features: AclHuK-XzQbdvaiv61WJyi_8ZqhwGRBCNFscgmlOjr77cMwMQUJZYeAEPiQPfDQ
Message-ID: <CAHS8izMDj5a0xyX4HAoAt=djt7As-Ko=LyEUfq9iJnPoCegXsA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/5] net: remove skb->pp_recycle and
 consolidate netmem refcounting
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, imx@lists.linux.dev, 
	linux-rdma@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Willem de Bruijn <willemb@google.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Byungchul Park <byungchul@sk.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Wen Gu <guwen@linux.alibaba.com>, Philo Lu <lulie@linux.alibaba.com>, 
	Justin Chen <justin.chen@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vikas Gupta <vikas.gupta@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Nicolai Buchwitz <nb@tipi-net.de>, Satish Kharat <satishkh@cisco.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, 
	Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Daniel Machon <daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Yibo Dong <dong100@mucse.com>, 
	Brett Creeley <brett.creeley@amd.com>, Justin Lai <justinlai0215@realtek.com>, 
	Larry Chiu <larry.chiu@realtek.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Paul Barker <paul@pbarker.dev>, Masahisa Kojima <kojima.masahisa@socionext.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	MD Danish Anwar <danishanwar@ti.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Ronak Doshi <ronak.doshi@broadcom.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Erni Sri Satya Vennela <ernis@linux.microsoft.com>, Eric Joyner <eric.joyner@amd.com>, 
	Mohammad Heib <mheib@redhat.com>, Prabu Thayalan <prabu.ponrajthayalan@amd.com>, 
	Chintan Vankar <c-vankar@ti.com>, Nora Schiffer <nora.schiffer@ew.tq-group.com>, 
	Alexander Sverdlin <alex@sverdlin.org>, Kevin Hao <haokexin@gmail.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
	Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:15=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] page_pool: TOCTOU race in page_pool_unref_netmem() non-RMW f=
ast path
> - [High] tls: page leak between netmem kTLS records and mlx5 tx_sync_info=
_get()
> --

Real issues.

pw-bot: cr

--=20
Thanks,
Mina
