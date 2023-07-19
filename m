Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F2C138
	for <imx@lists.linux.dev>; Wed, 19 Jul 2023 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689769578; x=1690374378; i=markus.elfring@web.de;
 bh=BEg4VEyO1JURsTxwHcxFLPIFxlro5BRbE2q/bmQSx/0=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=iUGhsZUWUT8T9U7+qI1bKu1lyw3M5NpAGDaM3k7lIWX5s4dg6AHRbLqClkvZDuhrMouT/X7
 nj21mcve+4sjQpu7eHPxhPWia6g2LWUFQmCFQHg9EwU+vgp1lSa2wI+3NfVmSQmMGN+mUcnGY
 xZ5vb8yOTXL8EsaWQZKBZOCnex8TwOf9i7i/0FkK+wlZSH1YfDaJ/HP6rBYfdVi3lRzASYN0e
 iJvJ75adgnvIntIKX4grh777C70ATI2U1Ks6gCmKi6e4fb+QhPNdfFSNm/BoSYybK32bCbIv1
 Fx8aDnaAcajvMBU/awa/LcWkxtNUJx2uh2Vrm2BijTSBfVII6bAA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqqTV-1pZJEm45yr-00mkG8; Wed, 19
 Jul 2023 14:26:18 +0200
Message-ID: <48020d1a-471d-1f82-f399-52014651b822@web.de>
Date: Wed, 19 Jul 2023 14:26:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Rob Herring <robh@kernel.org>, Roy Zang <roy.zang@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20230615164113.2270698-2-Frank.Li@nxp.com>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230615164113.2270698-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AIjvDM8s9vNXubm4WHz1OKvLwQ10Q4CK5reiwidoHJ97tp/jpdC
 qg+7hCtBXAiPdWKdT+6ZjAWzKXkUpmP1Y8lgIR26qmEzLyHgqXqmAShYm2Q+nVdvbkyDsqC
 Dg9LL26GuAixjmMpQkhPpevQ1wK48ZE2RlaZ55itD7PM0sWOzgqnIqDWbRrXe4qmI3IPSdo
 FDMlTVrCDQMGTYnp28QKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FeeNq8iF1dU=;1zPylNP2C2RNFGo0QeONcWDFLqY
 4eXnuUU/sMIYiR5eRB86wYzH16p1+ELAh2IdO6OrPiBvEZbDaGft6FF/wIjrv7HOApNMvxmij
 e586CHAURxtDU9guqB47XhOrVupROsl3j93/8D5YSugA+1psoyEsuPdfksGsvMZOPD1CmxE3z
 kp4AOb6r9bzyyUy6HFBByBloYx0RwWLxW/ksbwEjpUmnpnYVBpeYYky/jhXHx7R9DWC7WwfZg
 +nyhO8B53VfAwheRz26L2b8qvykFFxoxV+H3SgYu2PqcAtYvX/3ELoYTc7isP9xc0CqMsCY7B
 hJt9fnSvAZDjMBu9uKIAYV12AuCOtiHiA22VIAK1TOj/nlSTZBDCdY4LSaf5VQtdZXuijJ2ao
 oCL2ew7unTRE+EtdyWFtXAWmsrkzSnHGv++IssutDvDtxUtFnCofQSD4pCFWgAXtGXq5kMlyL
 5Pgp84BFgWL1i1VUBE0PYb0bkZWmofcQmmHuR56zqritbuoZNmJEDTWfYP3j3BuGRUIMJHIWb
 f3p4pwai/UZ42I+4bnkhgpWpTUzAO+ykXgNQVUwXpPKl1Ipg/8rOVnqHn3LF9f5E9VLpbnCtR
 SsI6pIBOR2v1JU83MT+D1Mvch++8025xS/FXZPXp6OWLX3JkCRganZFgVSKqKDG3vA3xooqPa
 2QPnZoI1Yvz0TQhuLGfvrKddVG6zAIpgmOqLbj0JhOg/S3K5m5ikHfg2UweNYY7CP3E2nDFwd
 kzDhtqitLpk0ytbe1hQRxPehASSlLLJa8R7kMIzhQd3OY0edADMtyAU7rH+gNDjFTYWEpQs4V
 NjZpZpdtldpDMuymwaf7giHnxV36cy/2RsqkESgd/fmXsQgXRTmv6ipLqzVYE1qm8815netEg
 5LXK01YVq0dTNw/cfdOYAN3ckXlSEpJRI8u1cLyJRd//k9kU7hYZ3LctXEa0Wax/FPYQZBdcp
 nArXtw==

> A workaround for the issue where =E2=80=A6

Would you like to avoid a typo in the subject for the final commit message=
?


Will a cover letter become helpful also for the presented small patch seri=
es?

Regards,
Markus
