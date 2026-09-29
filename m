Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A6A36B934
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700511; cv=none; b=MbrTKcV4T7MEk+IayxBrz//1wpWtWHPQgscz6/MI/LoOdS1GHBWti5XGd58nlintoLt/nir/Yd7Oe5TZl7Wcxujk0si/Y2GGHkXdGjiac2XLrU84qyKnnx5BassC4uJgsL+YzDj9uLIjMAaj+9w2zGLJbc/Ac0kFg2XQ1JdXIkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700511; c=relaxed/simple;
	bh=gjzKEDoEc/+GLpE25sXuiGP4bdJDlHX/8bJR6oQseoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tiLNk5b9Yp3Y2zxsqFwOaJiFloIQtKIJaCvZcSl2x0k2ryGxBpLbyrSxLuiKmJz5o2uldGNCv71W1IbEoerc+qLUAlD03uvTFLaIsvIwwMum7hwmjyF2f9FCnCPXheblJZIy53otygItuwr2rO7HBuxXXqhzTSDulm/WKxQey2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DMxHGGXk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DMxHGGXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
	b=DMxHGGXktCZTg9vEMFxILHo8iwXL9AL/5zTm/b78fVyJMYIUzQvjwE5qfBhqgW0EauabPp
	ZuHte2NLsv1cEQp2Ydt1UYh5u/dGm3Tut1mGeK6grtss5fjgRwcMKz4syQhYAuSmVtJTBA
	38fSkwRnI1DdGXUmIv1Bg/NSdRipwdA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-H2vKZzXNMbmnn1ZMavfLTg-1; Tue, 29 Sep 2026 12:48:27 -0400
X-MC-Unique: H2vKZzXNMbmnn1ZMavfLTg-1
X-Mimecast-MFC-AGG-ID: H2vKZzXNMbmnn1ZMavfLTg_1790700507
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c614646e9so502533885a.0
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 09:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700507; x=1791305307;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
        b=Qh51TFU5Zir7HNCyyw6SDLS9P8XmG3w2bd9ahlcbSO4RdQJHFIKcg4yxB9+EWQAQkr
         WYKM4kAYhopmF8hsjjKh043Z6D48VNZ8AAd6Tml/3CJtxmlIoidiaMBIh9cdKDaqsWKM
         Xr5JhFqAWBOsQ3hVZ/HrXANc0VLmeeZtpUncjeRhmTytN6bEYI1LQn1OyZ0efGn7LC69
         1lCHuwZUyrtujMUo3P/M3fwtAsj/dr21bU1hD/nGPmYbuq/TCtow7TM5summRuxihhS0
         XUL62/DfE3LFADcjQXNtpHF5RvuBCO8OIK1F7QJPtfnmrSv4A/rxLopKw6kJtCFrPAGX
         7+VA==
X-Forwarded-Encrypted: i=1; AKwUvByf7O7pKqK1IfXoSPreh/JexaHQbxfma3Xh5kQKu7I2f2RKeYuPoWwwhpiG87K9GbGz3lQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lCiOaPdLx1TvJCQGkTgVLG4hr9KZ1/s87q6+ooA0gSG10AdpEV
	X2lmPQbNvOPg5AWyzq9ONPlfHCF0PnnVTx0hmcRoTYQl8NzkNseiM4TZe4VN6xzjaik446LEwqI
	X9OJipC05+GhTkeqG9wEzpjYnheFQIMR53TepCPkM/04Hf4GgG8+AcQ==
X-Gm-Gg: AYBFou3LIdHl0QTynveSU1EHDWqW3UR7se9BQyt8ri7diBRlNEEeMDSVYxEwiWr/zYx
	ntNJ481vWvjhttJqCpjOB7KsiaiUhOIOKtcZmPO0HIpxciT6gADexjnrDMVx1HwlqxyZtii9QAH
	/dG2keWv+GuscH34ip8SZsF7VqNwMIhxtP8x+gCoOVLCyW85Xv3CUE8uhbBQNjlCQsY2YtcME7W
	5GUTk7wf6qf3JxiMOAyA4GiuR0cZtw5xRApD96GGBRXYXG+sAnntTZkl3/Ud2o6fsTnp6SXBfD+
	OqpI/BldbbxoINo27XgT91LARvJSwK79kKQlZj/Bp/EaPlJmZpsWO178osPPk+FYWrRZCYlt61e
	pCEl+uH1hjssWk9rRoZiBXfY3vKftIQbRDrRHfXL1VgkCweVtUAE=
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21399385a.47.1790700506619;
        Tue, 29 Sep 2026 09:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21392085a.47.1790700505852;
        Tue, 29 Sep 2026 09:48:25 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f54529asm10347985a.37.2026.09.29.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:48:24 -0700 (PDT)
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
Message-Id: <179070048452.199845.10870046832708018931.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:48:04 -0400
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SAHYf/h8Oe0K/ekB9Nro0D69org/h+4brL2o93Uibw4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v75WObHBi99/6nvz91sfuy9/aBE213x2T6bCawPDb
 lVWxc/nOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjILQVGhi1pPpPUYzwFivpu
 5+WFhLcrLrx2Yo2ZS3zjMwHTvjirboZ/GtcvfHvLK77mYvkzJi1D73jODRmTUlvF/1fM2lIoJ7G
 eBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o3Pir27bbM9taRLq_E3rWMrLOYWgzVdB_kwmvQ5mT5o_1790700507
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

[2/4] clk: validate spread spectrum configuration
      commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

