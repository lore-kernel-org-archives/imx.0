Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453570;
	b=pMjw6oVSOR4F82cwcr+YP4NGTOf4815tC/5OiraGExwEAQeyJkXcD690apfMwtoMaVfz
	 BX5pBu082dqfV+wJxWEhLOuMbeXaOW01PkhfeAFR9ShdnGV+34+YigTxC62WOnwFY85e6
	 82sENTav3VpJbNQS/MzcL6JGpavBPzHiIeqx9QScRKR8XFgenNgSqvs1CWPETQrY9DGZQ
	 PjjITHVrsW7Zw5qiRK6ZEMYSPlKUbBVui5CjFyzTMDDHP5mpx0RXfxcZXHtb9KUTKBvX5
	 AO4X1apmOrqattTWd0DKt2OSeF4z9PrsSmIBUH+rYqJHP4KoyiaZsAZRMOXiDgY3wqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453570;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=vRr1E71mVJR0zSBKp0iFlXo/NI5MRnqQuv8evv8pPt7XXCZn4pLV5MHynp6htTAy4xg9
	 21pdEEGh/2Lv+xYc/Gmb4k2SuezXxkloUs/3+rE9CB6DbmtPS29TZNpnGAFonimEfe/sJ
	 58OxtpCgP4LGhb+UeiCU8bZ1w2FE3Fq3dord1cv6WHYEDgPBTxycDU8JNDq+mCtGN9IkL
	 qPsvbeCstrK9jj18cxVmQysjKe1DPYCyr72RHsSComZCKOcEgXDENJzRpQG52DVFrtgmJ
	 T2K0W1x5iYWRjF0dVBsveD8/HRJI9oC2yxHQ7YbWa2IYc65tAO/Mtz3l9vgOsceqIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4C606A31C
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 23:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792453568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=F30W39f+TIXr/Fp5w8uuXB9BQWFgNgayBKcU8lpItwX4Cg808rbuFGNJl54mVfJwMwu1+O
	+E9RwfNhVXOOIqQF+HIAW6fvWCgqPYyJRmvG7+Pg64bdlOrt7fRfnbf6KXvf7jW0BgCY4k
	XH3MmN6IIcQg0Gsqa6ZupKIZqrvinSo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-r3Z5izz2M6WeajuUzoCZ6w-1; Mon, 19 Oct 2026 23:46:07 +0000
X-MC-Unique: r3Z5izz2M6WeajuUzoCZ6w-1
X-Mimecast-MFC-AGG-ID: r3Z5izz2M6WeajuUzoCZ6w_1792453566
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535252004e9so64945461cf.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 16:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453566; x=1793058366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
        b=HOowzQu63rSImKIW7zQGnOd/oE+ygm/juWsH5VW6i6HCu0x98pTRQvdyJwQ0hd7e7s
         zn8W+KuzyY350o9EKFmoUklvwWTTYR29BapIjpUwyjWgtMOV7tlCXk+v5XrV8oqcuney
         I01FgQjubm7M8DgaDtPeYyvwN9Z6RAEFZm+b8dX6Fdic8mgm1m9Vu4xcROo3cVs/+mPf
         dO6eTM77ahDcT9QnMWxF2UTfSeGan8bReb48b0BdczW7+OwcY71dlINOTdECP81CvA9U
         DBWjy2VOyIPTjFhOVRZb88+SICcLjP5hU/2A6/ZCkSoodAtfye61nyrGId1nDu+aOSQf
         vduw==
X-Forwarded-Encrypted: i=1; AKwUvBxVZh53zbuF5HrswahUtUtYaO/EopoPvmrFFpvTHUlycxC9yaAsEFeWBnuxfF4xUuMu5n0=@lists.linux.dev
X-Gm-Message-State: AFq9FYKsNKz8c7unDzJ5fjxq2s9ZAS/o96LLQH90Bu8buMG14V04D22g
	bfXt1h7fq8m/JCPgo0haoohZ0jHdaovyLwHHAmQQAsSYZmts0OOrVFBjaI3uq12yoNsxcxAtBcg
	YNKPTJLg+358wreLSHPBhwk5ni/u+xnzl55xTZXhbeSdB6OeHaSBtrA==
X-Gm-Gg: AYBFou0wIRAFJzHM9wq+bmhNqR8ylwJ8jhpaU1utpTbTuspAzOYtG9D4pB4snQwTJ2b
	c/TPc4WphVGh26LHPR60dF9RrADoVJIuZ5CcV7A15eY8OZEmKiZN+K+R/0FNoBmeWIym45Vhx6a
	jrCgRZRBxkqR1LhmXeMTNmUn1tRjFcx4Kn4sN/30gesabT47wU1RjhpBNL3np10atukmEV4jgUI
	L9qre6jyDqyb/q+HLyH7Ay3R0UMRCYKiPGcTa1PbTPEiuTTx9WNhw3CvrBv6RwP3nubutOhwiKh
	aEBkjw54bZgM7Wtpn7uCsn0z/lbRVnpZGVSDwwPqSR3j24wTr09fwsKp2WBS4myre7PpfjMXPVP
	fodeOdaOQLXDk91IgHZkROWMypuDfsXLr83auik+ZD0zQ4PE22+XD8YOiist9BJYMeYykLk1HPU
	KvPhq8wZM=
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027521cf.46.1792453566409;
        Mon, 19 Oct 2026 16:46:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027101cf.46.1792453565913;
        Mon, 19 Oct 2026 16:46:05 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm66755561cf.14.2026.10.19.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:46:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179245353543.117654.7478218308853360546.b4-ty@b4>
Date: Mon, 19 Oct 2026 19:45:35 -0400
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Zr0ZL61ygpUZIVKFPvP8VcvRE1XoRbIaNzvBa5Hves=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKurd5U80jc7qBgokvY8r53frNq2yaIPGd6+GGbZZjne
 n214wyBHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzky0pGhs+LnM6uiHrk9rr4
 0/4fMZde/7r+b8/7skUtx49bnjbmeXiY4Tfbf8k6TpPFLxOWNKb+9OppWtzn388WYsB+4mNltFr
 8V14A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FgLhez5QGri027AjSFaRezfg64WafxbLmggAUkSGZJ0_1792453566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[4/4] clk: imx: pll14xx: support spread spectrum clock generation
      https://git.kernel.org/clk/linux/c/1ca4bd0c6c0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

