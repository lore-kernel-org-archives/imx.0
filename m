Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F64199237;
	Tue, 23 Dec 2025 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511873; cv=none; b=qMgOJxb4dibM2ubAdnMbKUNKkggJiVG0WOCXiNYhm8b9UgXkcoAfdgPABLVZY2G5IzfT7OFeWKjGa3JqtT2wn2pAZk/qPLJ1m0hUe8l4Sed+oUhgaQ2KtP8OHlW3DVQY2BOwLvAUVcRhoIc+ghHKLxvaBstYJJ+8vi4aezrzCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511873; c=relaxed/simple;
	bh=UpO9gOAmsb4xmiLPxSRxi21Q3cw+GzU44VBAhFU6H1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mNDwS+fZkOtyvDGfbDBXcxE5Ta3wpgT0DSlhQZlqfwRd7o4ZinDS6V+qchhJySXlonnSLf8Fl4e1vQz9fB7/zaUUJeIQiVq4zD/nQW8+oVxeiQYuU/bUTAfqdJNmH8udHhikp9drCoE03w/eXaB5rK6Qi+BgJuCigWyZgJuPedU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FO5zGhNr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FO5zGhNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F4DC116B1;
	Tue, 23 Dec 2025 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511873;
	bh=UpO9gOAmsb4xmiLPxSRxi21Q3cw+GzU44VBAhFU6H1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FO5zGhNrnWiNN0lx2ucUFPxSGiQ5WRDYGn2pTLpANt7K9QNPAsbP9AESENuhsn/Iy
	 /lDTnKzEfE0SJ9D5erNttJpt29yKjBcRBO49snqgrgVN7MCwRy7JOtk4Le/R/jaFLj
	 KMDBWNNIhy0wmm5Km+25C5H0PX0PSHhclanV3qlR5z3P6xOfd53q/+CXPwpbWxY8f7
	 cQyxOkNAwwwY9ZHPF9KtnZ1v8zkajE8Dli4UWPDRcKuraGKq8QHuvJ8fr2KKW6tN1q
	 SoMuc8mBD4me5zpFzhT+2LuDh0CBG0DmsFX+iuYnD+wP7i1Ve6BT1xNaAOn/BGEprO
	 jWhdswTrrEHPw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251219081354.3806806-1-xu.yang_2@nxp.com>
References: <20251219081354.3806806-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: change ssc_range value for
 i.MX8MQ
Message-Id: <176651186992.759340.3813003594906863484.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:29 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Dec 2025 16:13:54 +0800, Xu Yang wrote:
> According to IC engineer suggestion, set ssc_range as -4003 ppm
> will have more tolerance for EMI, and suitable for more boards.
> Besides, it's confirmed that with this setting the TX SSC test
> will pass on one customer board.
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: change ssc_range value for i.MX8MQ
      commit: c9d03933ea161a5543e15857ee519c60ec04fe9b

Best regards,
-- 
~Vinod


