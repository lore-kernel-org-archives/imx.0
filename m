Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE4B22A81A
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686119; cv=none; b=jFAfvsjyxnIrU6g7oxEAkeB97dOrQkqLMQ3YJN9ruoMo82sQnRhSNTQv0DrIvOKxGNBNLEru87KABhafrWCRWQfz86zlAwuG9IApLm9xJgNhaCVhOpWtmaopq1gbxDBU7tG/B3atxvSBFCWH/pBOjHb17xyjP4ZxZv6LHwGLTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686119; c=relaxed/simple;
	bh=03Gv4s873UjI+xmcPzGntYsW1I0NmUQapHmHTtq49bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EcROcIj10o+iHeqiZXfCAD9o+j06+qWldgmHECQscHCvcvmA0bjx/bna+CRzUTiWd+CSvmA33dxD9423IvcKqC4dQVeWWNeG8MNPP4qzPqwZardTOe8SklUeLUAOHTwp50Ajy0dpVoj6cwtrKL0T95r1BwFbwfSal1wCpFoi2yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uffNNV5O; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uffNNV5O"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bdf0cbb6bso30241815e9.1
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741686116; x=1742290916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLzoATiFKr1B8iCGXJt123FaClKzJD6A9v143qispxo=;
        b=uffNNV5OWnrGgxhC1sRfZUqExtteepxwTgmZ7aEW639vApn9kDl4iRPOdpWxDrxQcq
         HUjrAOoscJzSkteQ5swqWXGzjfNAng7lrI/gBwRni6vaAinv2w01m4NLFBfTRMsofgzZ
         2YG9E4lOnmhd6l1GSTHpR+iy9ZUFPOaj2QE/lBo8yTHhT4nTufJVcRqYAw2nl4JK83QM
         J9qPXtEMjetCW0pH4daAzSrxlZzV78L++KdwBvJaMqI0qDFKXRjxeTRffsKsO5NW6G72
         +Xl/kFeLUZpVETl8skZFnn5VK0S2t3180SrkBNjYgFib5xZXxnIHEg9muqKbw2ZpWX4D
         lfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686116; x=1742290916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLzoATiFKr1B8iCGXJt123FaClKzJD6A9v143qispxo=;
        b=DC/T1V69kliGmxszma4XhXIxEkcODiCoL9Etx5BKF+VLNuSQyhsXaIs4rgHm96rIJI
         zW0XxHaax3dfJNyNk068QlCSYJLS/OoKeD7iXWC9ZPaShaNidpKIYNvPzizEp1rkh4/f
         zVzNEyiTL2lWE94WYwu6Re7W3fM6IFdA0Iwc3d2pD+Cl3lirmvJ1iXGAldu+d/zpqMBV
         WlYle7X6TbQidYLynU+qAh1fchFZWiHAS8/xU0pTM/hFic5wsgwjkTlcWVwTZgrwRHLJ
         MdCHU2PGOQZpxmxTJqJ3FpZHBsOT+x2jwEOtDjOhA2c3GCSrhwJrx0fePZ+mIX1Rtghx
         oD6g==
X-Gm-Message-State: AOJu0Yyi1BJtJBERmNuMawjBgCIQH7+9zFRCL0IkUZUH6vzY9Zk8V0+k
	vIimehD4PQj5SWr14L506eregBytVfU8oLuxV2kKcN3NbbHGBiGweE+rT9TX3Yo=
X-Gm-Gg: ASbGnct8rTIekW6lEJaY1Rc7qkXu0WPCjUE3QAcZkl8F+VmgET1N6LIb/gVUQZtLmK9
	UhvNO5l+v1lnZ8oJbwTKD9R+xm7nDnAJnPVrK4PBdyspcMFCX5jOT/ko5rhWEGGGXPX1Jl9TUp2
	deb1Md5RxwSWRDpCtaoMAZhKYzimqCYOkZvms8Wx2f535VtZMhWUSDZFpWQKh/LtEyrTtPEx7tQ
	5hEBjndZUmpUJec+adZG4VHq1ZMv05pHwPMvrNHSqjQvcDlEk1pvfmYaMGME7FYs0+if+SyTrUq
	fDg0l5THxOUFe2Yshj3WKzRzNAW0Wbd5eUMwlm2wCRE=
X-Google-Smtp-Source: AGHT+IEdiLqVceheU3laOr68GSrQpdRVp3WLSzOWbWgbN9P+MXJtFbu6q15juGPjGglXL1E+FUFlQQ==
X-Received: by 2002:a05:6000:2c7:b0:38f:451b:653c with SMTP id ffacd0b85a97d-39132d77a3bmr10037297f8f.7.1741686116146;
        Tue, 11 Mar 2025 02:41:56 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdb9sm17427957f8f.27.2025.03.11.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:41:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.15
Date: Tue, 11 Mar 2025 11:41:40 +0200
Message-Id: <20250311094140.722154-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.15

for you to fetch changes up to 06a61b5cb6a8638fa8823cd09b17233b29696fa2:

  clk: imx8mp: inform CCF of maximum frequency of clocks (2025-03-03 19:02:15 +0200)

----------------------------------------------------------------
i.MX clock changes for 6.15

- Add missing AXI clock to the i.MX8MP AUDIOMIX in dt-bindings schema.
- Fix DSP and OCRAM_A parent clocks in i.MX8MP AUDIOMIX clock provider.
- Document vendor specific operating-mode property in i.MX8M clock
  provider dt-bindings schema.
- Apply overdrive/nominal constraints based on DT property in i.MX8MP
  clock provider.

----------------------------------------------------------------
Ahmad Fatoum (2):
      dt-bindings: clock: imx8m: document nominal/overdrive properties
      clk: imx8mp: inform CCF of maximum frequency of clocks

Laurentiu Mihalcea (2):
      dt-bindings: clock: imx8mp: add axi clock
      clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents

 .../devicetree/bindings/clock/imx8m-clock.yaml     |   8 ++
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml |  10 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c              |   6 +-
 drivers/clk/imx/clk-imx8mp.c                       | 151 +++++++++++++++++++++
 4 files changed, 168 insertions(+), 7 deletions(-)
